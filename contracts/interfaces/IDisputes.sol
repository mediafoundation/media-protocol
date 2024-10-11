// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IDisputes {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error ReentrancyGuardReentrantCall();
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
    function MAX_DISPUTE_DURATION() external view returns (uint256);
    function comments(
        uint256,
        uint256,
        uint256
    ) external view returns (string memory);
    function disputeCounter() external view returns (uint256);
    function disputes(
        uint256,
        uint256
    )
        external
        view
        returns (
            uint256 dealId,
            uint256 amount,
            uint256 status,
            uint256 disputeDate,
            uint256 disputeEndDate
        );
    function disputesIdsByProvider(
        uint256,
        address,
        uint256
    ) external view returns (uint256);
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
    function recoverNative() external returns (bool);
    function renounceRole(bytes32 role, address callerConfirmation) external;
    function revokeRole(bytes32 role, address account) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    receive() external payable;
    function createDispute(
        uint256 marketplaceId,
        uint256 _dealId,
        uint256 _amount,
        string memory message
    ) external;
    function resolveDisputeByProvider(
        uint256 marketplaceId,
        uint256 _dealId,
        string memory message
    ) external;
    function appealDisputeByProvider(
        uint256 marketplaceId,
        uint256 _dealId,
        string memory message
    ) external;
    function revokeDisputeByProvider(
        uint256 marketplaceId,
        uint256 _dealId,
        string memory message
    ) external;
    function appealDisputeByClient(
        uint256 marketplaceId,
        uint256 _dealId,
        uint256 _amount,
        string memory message
    ) external;
    function getDispute(
        uint256 marketplaceId,
        uint256 _dealId
    ) external view returns (Disputes.Dispute memory);
    function isDisputeExpired(
        uint256 marketplaceId,
        uint256 _dealId
    ) external view returns (bool);
    function getDisputesByProvider(
        uint256 marketplaceId,
        address _provider
    ) external view returns (uint256[] memory);
    function setMaxDisputeDuration(
        uint256 _maxDisputeDuration
    ) external returns (bool);
    function getMarketplace() external view returns (address);
    function setMarketplace(address _marketplace) external returns (bool);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
}

interface Disputes {
    struct Dispute {
        uint256 dealId;
        uint256 amount;
        uint256 status;
        uint256 disputeDate;
        uint256 disputeEndDate;
    }
}
