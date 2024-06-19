// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Sample.sol";

contract MSample is Sample {
	error SampleAlreadyRegister(string);
	error SampleNoEmptyField(string);
	error SampleInvalidIndex(uint256);
	error SampleSameAmount(uint256);
	error SampleNoAuthorized(address);
	error SampleLinkVideoalreadyExist(string);
	error SampleNoRegister(string);

	modifier onlyAlreadyRegister() {
		_requireNotRegister();
		_;
	}

	function _requireAlreadyRegister() internal view {
		
	}

	modifier onlyAuthorized(
		address _address,
		uint256 _indexSample,
		uint256 _index
	) {
		_requireNoAuthorized(_address, _indexSample, _index);
		_;
	}

	function _requireNoAuthorized(address _address, uint256 _indexSample, uint256 _index) internal view {}

	modifier onlyLinkVideoNoExist(
		address _address,
		uint256 _indexSample,
		uint256 _index
	) {
		_requireLinkVideoNoExist(_address, _indexSample, _index);
		_;
	}

	function _requireLinkVideoNoExist(address _address, uint256 _indexSample, uint256 _index) internal view {}

	modifier onlyNotRegister() {
		_requireNotRegister();
		_;
	}

	function _requireNotRegister() internal view {}

	modifier onlyNotEmptyName(string memory _mainName) {
		_requireNoEmptyName(_mainName);
		_;
	}

	function _requireNoEmptyName(string memory _mainName) internal pure {
		if (bytes(_mainName).length == 0) {
			revert SampleNoEmptyField("main_name");
		}
	}

	modifier onlyValidIndex(uint256 _index) {
		_requireValidIndex(_index);
		_;
	}

	function _requireValidIndex(uint256 _index) internal view {}

	modifier onlySameAmount(uint256 _index) {
		_requireSameAmount(_index);
		_;
	}

	function _requireSameAmount(uint256 _index) internal view onlyValidIndex(_index) {}
}
