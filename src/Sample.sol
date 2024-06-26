// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./MSample.sol";

contract Sample is MSample {
	event ArtistRegistered(address indexed artist, string mainName, uint32 registeredAt);

	struct SampleDetails {
		address owner;
		string uriVideo;
	}

	struct SampleMusic {
		uint256 idSample;
		Artist artist;
		string uri;
		// SampleDetails[] sampleDetails;
		Totalsupplies totalSupplies;
		uint256 price;
	}

	struct DescriptionPreimage {
		bool has_preimage;
		bytes32 preimage;
	}

	enum ArtistType {
		Singer,
		Instrumentalist,
		Composer,
		Lyricist,
		Producer,
		DiscJokey,
		Conductor,
		Arranger,
		Engineer,
		Director
	}

	struct ArtistData {
		address owner;
		uint32 registered_at;
		string main_name;
		ArtistType main_type;
		ArtistType[] extra_types;
		bytes[] genres;
		bytes32[] assets;
		address NFTFactory;
	}

	struct Artist {
		bool is_artist;
		ArtistData data;
	}

	struct Totalsupplies {
		uint256 totalSupply;
		uint256 totalSold;
	}

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
