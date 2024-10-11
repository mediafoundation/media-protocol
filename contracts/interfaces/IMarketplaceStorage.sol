// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplaceStorage {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error SafeERC20FailedOperation(address token);
    event ClientUpdated(uint256 _marketplaceId, address _client);
    event MarketFeeRateSet(uint256 _marketplaceId, uint256 _feeRate);
    event MarketFeeToSet(uint256 _marketplaceId, address _feeTo);
    event MarketplaceInitialized(uint256 _marketplaceId);
    event MarketplaceMetadataSet(uint256 _marketplaceId, string _metadata);
    event MarketplaceOwnershipTransferred(
        uint256 _marketplaceId,
        address _newOwner
    );
    event ProtocolFeeRateSet(uint256 _feeRate);
    event ProtocolFeeToSet(address _feeTo);
    event RequiredStakeSet(uint256 _marketplaceId, uint256 _stake);
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
    function MARKETPLACE_ROLE() external view returns (bytes32);
    function PROXY_ROLE() external view returns (bytes32);
    function REQUIRED_STAKE(uint256) external view returns (uint256);
    function clients(uint256, address) external view returns (string memory);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(bytes32 role, address account) external;
    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);
    function marketFeeRate(uint256) external view returns (uint256);
    function marketFeeTo(uint256) external view returns (address);
    function marketMetadata(uint256) external view returns (string memory);
    function marketplacesCounter() external view returns (uint256);
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
    function owners(uint256) external view returns (address);
    function protocolFeeRate() external view returns (uint256);
    function protocolFeeTo() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceRole(bytes32 role, address callerConfirmation) external;
    function revokeRole(bytes32 role, address account) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    receive() external payable;
    function setProtocolFeeTo(address feeTo) external returns (bool);
    function setProtocolFeeRate(uint256 feeRate) external returns (bool);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
    function initializeMarketplace(
        uint256 requiredStake,
        address _marketFeeTo,
        uint256 _marketFeeRate,
        string memory metadata
    ) external returns (uint256 marketplaceId);
    function setMarketplaceMetadata(
        uint256 marketplaceId,
        string memory metadata
    ) external returns (bool);
    function setRequiredStake(
        uint256 marketplaceId,
        uint256 stake
    ) external returns (bool);
    function transferMarketplaceOwnership(
        uint256 marketplaceId,
        address newOwner
    ) external returns (bool);
    function setMarketFeeRate(
        uint256 marketplaceId,
        uint256 feeRate
    ) external returns (bool);
    function setMarketFeeTo(
        uint256 marketplaceId,
        address feeTo
    ) external returns (bool);
    function updateClient(
        uint256 marketplaceId,
        string memory metadata
    ) external returns (bool);
}
