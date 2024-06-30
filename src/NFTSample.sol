// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./MSample.sol";

contract NFTSample is ERC721, Ownable, MSample, ERC721URIStorage {
	uint idNFTSample;
	address owner;
	uint public price;
	string URIToken;
	constructor(
		string memory _name,
		string memory _symbol,
		uint _price,
		string memory _URIToken
	) ERC721(_name, _symbol) Ownable(msg.sender) {
		owner = msg.sender;
		price = _price;
		URIToken = _URIToken;
	}

	function mintPayable() external payable onlySameAmount(price) {
		_safeMint(msg.sender, idNFTSample++);
		_setTokenURI(idNFTSample, URIToken);
	}

	function withdraw() external onlyOwner {
		payable(msg.sender).transfer(address(this).balance);
	}

	function supportsInterface(
		bytes4 interfaceId
	) public view virtual override(ERC721, ERC721URIStorage) returns (bool) {
		return super.supportsInterface(interfaceId);
	}

	function tokenURI(uint256 tokenId) public view virtual override(ERC721, ERC721URIStorage) returns (string memory) {
		return (URIToken);
	}
}
