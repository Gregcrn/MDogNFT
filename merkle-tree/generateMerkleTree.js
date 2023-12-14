// import whiteList address from whitelitstAddress/address.json
const address = require('./whitelistAdress/address.json')
// import merkle-tree library
const { MerkleTree } = require('merkletreejs')
// import keccak256 library
const keccak256 = require('keccak256')

/**
 * Verifies if a given leaf is whitelisted in a Merkle tree.
 * @param {Array} whitelist - The list of whitelisted addresses.
 * @param {string} address - The address to be verified.
 * @param {string} root - The root of the Merkle tree.
 * @param {Array} proof - The proof path from the leaf to the root of the Merkle tree.
 * @param {string} leaf - The leaf node to be verified.
 * @param {string} root - The root of the Merkle tree.
 * @returns {boolean} - Returns true if the leaf is whitelisted, false otherwise.
 */

// create an array of address
let whitelist = []
address.map((address) => {
  whitelist.push(address.address)
})

// create a merkle tree

const leaves = whitelist.map((address) => keccak256(address))
const merkleTree = new MerkleTree(leaves, keccak256, { sort: true })
const root = merkleTree.getRoot().toString('hex')
console.log('root', '0x' + root)

const leaf = keccak256(address[0].address) // replace with address to be verified on whitelist
const proof = merkleTree.getHexProof(leaf)
console.log('proof', proof)
const isWhitelisted = merkleTree.verify(proof, leaf, merkleTree.getRoot())

console.log('isWhitelisted', isWhitelisted)

// The `proof` is what you will enter into the `merkleProof` parameter in Remix.
