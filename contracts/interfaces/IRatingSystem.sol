// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IRatingSystem {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error SafeERC20FailedOperation(address token);
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);
    function clientRatings(
        uint256,
        address,
        address
    ) external view returns (uint8);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(bytes32 role, address account) external;
    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
    function providerRatings(
        uint256,
        address
    ) external view returns (uint256 sum, uint256 count);
    function recoverNative() external returns (bool);
    function renounceRole(bytes32 role, address callerConfirmation) external;
    function revokeRole(bytes32 role, address account) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    receive() external payable;
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
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
}
