// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./MSample.sol";
import "./LSample.sol";

contract Sample is MSample {
	event ArtistRegistered(address indexed artist, string mainName, uint32 registeredAt);
	using LSample for LSample.Artist;
	using LSample for LSample.ArtistType;
	using LSample for LSample.ArtistData;
	//using LSample for LSample.SampleMusic;

	LSample.Artist public Artist;
	// LSample.SampleDetails public SampleDetails;
	// LSample.SampleMusic public SampleMusic;
	// LSample.DescriptionPreimage public DescriptionPreimage;
	LSample.ArtistType public ArtistType;
	LSample.ArtistData public ArtistData;
	// LSample.Totalsupplies public Totalsupplies;

	mapping(address => Artist) public addressToArtist;

	function registerArtists(
		bool _isArtist,
		string memory _mainName,
		ArtistType _mainType,
		ArtistType[] memory _extraTypes,
		bytes[] memory _genres,
		bytes32[] memory _assets,
		address _NFTFactory
	) external {
		setAddressToArtist(
			Artist({
				is_artist: _isArtist,
				data: ArtistData({
					owner: msg.sender,
					registered_at: uint32(block.timestamp),
					main_name: _mainName,
					main_type: _mainType,
					extra_types: _extraTypes,
					genres: _genres,
					assets: _assets,
					NFTFactory: _NFTFactory
				})
			})
		);
		emit ArtistRegistered(msg.sender, _mainName, addressToArtist[msg.sender].data.registered_at);
	}

	function setAddressToArtist(Artist memory _artist) private {
		addressToArtist[msg.sender] = _artist;
	}
}
