// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Sample.sol";

contract SampleTest is Test {
	address public constant ADD_0 = 0x0000000000000000000000000000000000000000;
	bool isartist;
	Sample.ArtistData artist;
	Sample sample;
	address testAdd1;
	function setUp() public {
		sample = new Sample();
		testAdd1 = address(0x123);
		vm.prank(testAdd1);
		sample.registerArtists(
			true,
			"Loul",
			Sample.ArtistType.Instrumentalist,
			new Sample.ArtistType[](0),
			new bytes[](0),
			new bytes32[](0)
		);
	}

	function test_SetUpValue() public {
		(isartist, artist) = sample.addressToArtist(testAdd1);
		assertEq(isartist, true);
		assertEq(artist.main_name, "Loul");
		assertEq(uint(artist.main_type), uint(Sample.ArtistType.Instrumentalist));
		assertEq(artist.NFTFactory, ADD_0);
	}

	function testFail_SetAdd0() public {
		sample.setFactoryAddress(ADD_0);
	}
}
