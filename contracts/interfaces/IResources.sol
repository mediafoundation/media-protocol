// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IResources {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error SafeERC20FailedOperation(address token);
    event AddedAllowedAddress(uint256 _id, address _addr);
    event AddedResource(uint256 _id);
    event RemovedAllowedAddress(uint256 _id, address _addr);
    event RemovedResource(uint256 _id);
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
    event UpdatedOwnerKeys(address _addr);
    event UpdatedResource(uint256 _id);
    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);
    function MARKETPLACE_ROLE() external view returns (bytes32);
    function delegationCount(uint256, address) external view returns (uint256);
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
    function ownerKeys(address) external view returns (string memory);
    function readers(uint256, uint256) external view returns (address);
    function readersIndexes(uint256, address) external view returns (uint256);
    function recoverNative() external returns (bool);
    function renounceRole(bytes32 role, address callerConfirmation) external;
    function resourceAutoIncrement() external view returns (uint256);
    function resourceCounter() external view returns (uint256);
    function resourceOwner(uint256) external view returns (address);
    function resources(uint256) external view returns (string memory);
    function revokeRole(bytes32 role, address account) external;
    function sharedKeys(uint256, address) external view returns (string memory);
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function userResourceIndexes(
        uint256,
        address
    ) external view returns (uint256);
    function userResourcesIds(address, uint256) external view returns (uint256);
    receive() external payable;
    function addResource(
        string memory encryptedData,
        string memory sharedKeyCopy,
        string memory _ownerKeys
    ) external returns (bool);
    function updateResource(
        uint256 _id,
        string memory _encryptedData
    ) external returns (bool);
    function removeResource(
        uint256 id,
        string memory _ownerKeys
    ) external returns (bool);
    function addAllowedAddress(
        uint256 id,
        address user,
        string memory sharedKeyCopy
    ) external returns (bool);
    function removeAllowedAddress(
        uint256 id,
        address user
    ) external returns (bool);
    function userOwnsResource(
        address user,
        uint256 resourceId
    ) external view returns (bool);
    function getResource(
        uint256 id,
        address _addr
    ) external view returns (Resources.Resource memory resource);
    function getResources(
        address _addr
    ) external view returns (Resources.Resource[] memory _resources);
    function getPaginatedResources(
        address _addr,
        uint256 _start,
        uint256 _count
    )
        external
        view
        returns (
            Resources.Resource[] memory _resources,
            uint256 _totalResources
        );
    function getOwnerKeys(
        address _addr
    ) external view returns (string memory _ownerKeys);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
}

interface Resources {
    struct Resource {
        uint256 id;
        address owner;
        string encryptedData;
        string encryptedSharedKey;
    }
}
