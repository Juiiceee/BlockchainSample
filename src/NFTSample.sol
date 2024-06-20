// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTSample is ERC721, Ownable {
	uint idNFTSample;
	address owner;
	constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) Ownable(msg.sender) {
		owner = msg.sender;
	}

	function mintPayable() external payable {}
}
