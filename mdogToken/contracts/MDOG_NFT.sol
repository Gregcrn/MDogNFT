// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/**
 * @title MDOG_NFT
 * @dev Contract for a limited NFT collection with a whitelist feature.
 */
contract MDOG_NFT is ERC721, Ownable, ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 1000; // Total supply of NFTs
    bytes32 public merkleRoot; // Merkle root for the whitelist

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor() ERC721("MetaDog", "MDOG") {}

    /**
     * @dev Sets the merkle root for whitelist verification.
     * @param _merkleRoot The merkle root to set.
     */
    function setMerkleRoot(bytes32 _merkleRoot) public onlyOwner {
        merkleRoot = _merkleRoot;
    }

    /**
     * @dev Mints a new token. Only accessible to whitelisted addresses.
     * @param to The address that will own the minted token.
     * @param merkleProof A valid merkle proof proving the sender is in the whitelist.
     * @notice Ensure that the total supply doesn't exceed `MAX_SUPPLY`.
     */
    function safeMint(
        address to,
        bytes32[] calldata merkleProof
    ) public nonReentrant {
        require(_tokenIdCounter.current() < MAX_SUPPLY, "Max supply reached");

        // Verify the merkle proof.
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(
            MerkleProof.verify(merkleProof, merkleRoot, leaf),
            "Not in whitelist"
        );

        // Mint the token.
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(to, tokenId);
    }

    // Additional functions and overrides can be implemented here.
}
