// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./NFTSample.sol";

/*interface INFTFactorySample {
		function mintPayable() external payable onlySameAmount(price);
}*/

contract NFTFactorySample {
	NFTSample[] public NFTContract;

	function createNFTContract(
		string memory _name,
		string memory _symbol,
		uint _price,
		string memory _URIToken
	) external returns (address) {
		NFTSample nftSample = new NFTSample(_name, _symbol, _price, _URIToken);
		NFTContract.push(nftSample);
		return address(nftSample);
	}

	function mintPayable(NFTSample _NFTSample) external payable {
		_NFTSample.mintPayable{value: msg.value}(msg.sender);
	}

	function linkVideo(NFTSample _NFTSample, uint _idNFT, string memory _url) external {
		_NFTSample.linkVideo(_idNFT, _url);
	}

	function withdraw(NFTSample _NFTSample) external {
		_NFTSample.withdraw();
	}

	function getAll(NFTSample _NFTSample, uint _idNFT) external view returns (uint, string memory, string memory) {
		return (_NFTSample.getPrice(), _NFTSample.getURIToken(), _NFTSample.getIdToURL(_idNFT));
	}
}
