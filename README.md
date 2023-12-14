# MDOG NFT Project

## Overview

The MDOG NFT Project is a blockchain-based initiative that leverages Ethereum smart contracts to create and manage a unique collection of NFTs (Non-Fungible Tokens). This project includes a smart contract for minting NFTs, featuring a whitelist mechanism using a Merkle Tree for efficient and secure verification of allowed addresses.

## Features

- **NFT Minting**: Users can mint unique NFTs, each represented by a distinct token ID.
- **Whitelist Mechanism**: A Merkle Tree-based approach is used to whitelist Ethereum addresses, ensuring only pre-approved users can mint NFTs.
- **Limited Supply**: The total supply of NFTs is capped, ensuring exclusivity and rarity.
- **Ethereum Blockchain**: The project is built on the Ethereum blockchain, ensuring decentralization and security.

## Technical Details

- **Smart Contract**: The `MDOG_NFT` contract is written in Solidity and deployed on the Ethereum blockchain.
- **Merkle Tree**: Utilized for efficient whitelist verification.
- **OpenZeppelin Libraries**: Leveraged for secure and standard compliant contract development.

## Setup and Installation

### Prerequisites

- Node.js
- NPM or Yarn
- Ethereum wallet (e.g., MetaMask)
- Ethereum for gas fees (if deploying or interacting with the contract on the mainnet)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/mdog-nft-project.git
   cd mdog-nft-project
   ```

Testing
Run tests using Hardhat:

bash
Copy code
npx hardhat test
Deployment
To deploy the contract to a testnet or mainnet, modify the hardhat.config.js with your network details and private key, then run:

bash
Copy code
npx hardhat
run scripts/deploy.js --network <network_name>

yaml
Copy code

## Usage

### Minting NFTs

1. Ensure your Ethereum address is whitelisted.
2. Interact with the deployed `MDOG_NFT` contract using Remix or a similar platform.
3. Call the `safeMint` function with the required `merkleProof`.

### Setting the Merkle Root

The owner of the contract can set the Merkle root for the whitelist by calling `setMerkleRoot` function.

## Contributing

Contributions to the MDOG NFT Project are welcome! Please feel free to submit pull requests or open issues to discuss proposed changes or enhancements.

### GitHub Repository Description

🐕 MDOG NFT Project: An Ethereum blockchain-based NFT collection with a Merkle Tree whitelist mechanism. Create, manage, and mint unique NFTs with secure, efficient whitelist verification. Built with Solidity and OpenZeppelin.
