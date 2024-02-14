// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IResources {
    event AddedAllowedAddress(uint256 _id, address _addr);
    event AddedResource(uint256 _id);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event RemovedAllowedAddress(uint256 _id, address _addr);
    event RemovedResource(uint256 _id);
    event UpdatedOwnerKeys(address _addr);
    event UpdatedResource(uint256 _id);
    function delegationCount(uint256, address) external view returns (uint256);
    function marketplace() external view returns (address);
    function owner() external view returns (address);
    function ownerKeys(address) external view returns (string memory);
    function readers(uint256, uint256) external view returns (address);
    function readersIndexes(uint256, address) external view returns (uint256);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function resourceAutoIncrement() external view returns (uint256);
    function resourceCounter() external view returns (uint256);
    function resourceOwner(uint256) external view returns (address);
    function resources(uint256) external view returns (string memory);
    function sharedKeys(uint256, address) external view returns (string memory);
    function transferOwnership(address newOwner) external;
    function userResourceIndexes(
        uint256,
        address
    ) external view returns (uint256);
    function userResourcesIds(address, uint256) external view returns (uint256);
    receive() external payable;
    function setMarketplace(address _marketplace) external returns (bool);
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
    function recoverTokens(address _token) external returns (bool);
}

interface Resources {
    struct Resource {
        uint256 id;
        address owner;
        string encryptedData;
        string encryptedSharedKey;
    }
}
