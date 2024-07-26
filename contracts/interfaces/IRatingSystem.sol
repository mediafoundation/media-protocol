// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IRatingSystem {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    function clientRatings(
        uint256,
        address,
        address
    ) external view returns (uint8);
    function owner() external view returns (address);
    function providerRatings(
        uint256,
        address
    ) external view returns (uint256 sum, uint256 count);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function transferOwnership(address newOwner) external;
    function getMarketplace() external view returns (address);
    function setMarketplace(address _marketplace) external returns (bool);
    function rateProvider(
        uint256 marketplaceId,
        uint256 dealId,
        uint8 rating
    ) external;
    function removeRating(uint256 marketplaceId, uint256 dealId) external;
    function getAverageRating(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256);
    function recoverTokens(address _token) external returns (bool);
}
