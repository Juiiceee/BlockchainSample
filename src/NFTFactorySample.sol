// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./NFTSample.sol";

contract NFTFactorySample {
	NFTSample[] public NFTContract;

	function createNFTContract(string memory _name, string memory _symbol) external returns (address) {
		NFTSample nftSample = new NFTSample(_name, _symbol);
		NFTContract.push(nftSample);
		return address(nftSample);
	}
}
