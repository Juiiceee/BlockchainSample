// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

library LSample {
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
}
