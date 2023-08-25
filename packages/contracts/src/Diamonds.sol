// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;
import "./ERC721.sol";

/// @title Diamonds NFT
contract Diamonds is ERC721 {
    using Strings for uint256;

    string public baseURI =
        "https://bafybeibbnkwf2dduwslfza4o5uhfhubok4sohezu2knp47cvtezlbnicci.ipfs.nftstorage.link/";

    // Total index
    uint256 tokenIndex = 1;

    constructor() ERC721("DIAMONDS", "DIAMONDS") {}

    /**
     * @notice Returns total supply of DiamondNFT
     */
    function totalSupply() public view returns (uint256) {
        return tokenIndex;
    }

    // -------------------- MINT FUNCTIONS --------------------------

    /**
     * @notice Mint
     * @param _mintAmount Amount that is minted
     */
    function mint(uint256 _mintAmount) external payable {
        for (uint256 i; i < _mintAmount; i++) {
            // Get next token Id
            uint256 _tokenId = tokenIndex;
            tokenIndex++;
            _safeMint(msg.sender, _tokenId);
        }
    }

    /**
     * @notice Withdraw all ETH from this account to the owner
     */
    function withdrawFund() external {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "Transfer failed");
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, it can be overridden in child contracts.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    /**
     * @notice Returns if given tokenId exists in DiamondNFT
     */
    function exists(uint256 tokenId) external view returns (bool) {
        return _exists(tokenId);
    }

    // ------------------------- TOKEN METADATA ----------------------------

    /**
     * @notice Returns token metadata
     * @dev Metadata is stored on-chain
     */
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "DiamondNFT: URI query for nonexistent token"
        );

        uint256 _tokenId = (tokenId % 13) + 1;

        return string(abi.encodePacked(baseURI, _tokenId.toString(), ".jpeg"));
    }
}
