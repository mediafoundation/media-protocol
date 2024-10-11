// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplaceViewer {
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
    function getPaginatedOffers(
        uint256 marketplaceId,
        uint256 start,
        uint256 pageSize
    )
        external
        view
        returns (
            Marketplace.Offer[] memory results,
            uint256 lastAccessedId,
            uint256 autoIncrement,
            uint256 totalItems
        );
    function getPaginatedDeals(
        uint256 marketplaceId,
        address _address,
        bool isProvider,
        uint256 start,
        uint256 pageSize
    )
        external
        view
        returns (Marketplace.Deal[] memory results, uint256 totalItems);
    function setMarketplace(address _marketplace) external returns (bool);
    function getMarketplace() external view returns (address);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
}

interface Marketplace {
    struct OfferTerms {
        uint256 pricePerSecond;
        uint256 minDealDuration;
        bool billFullPeriods;
        bool singlePeriodOnly;
        string metadata;
    }

    struct Offer {
        uint256 id;
        address provider;
        string publicKey;
        uint256 maximumDeals;
        bool autoAccept;
        OfferTerms terms;
    }

    struct Status {
        bool active;
        uint256 createdAt;
        uint256 acceptedAt;
        uint256 billingStart;
        bool cancelled;
        uint256 cancelledAt;
    }

    struct Deal {
        uint256 id;
        uint256 offerId;
        address client;
        address provider;
        uint256 resourceId;
        uint256 totalPayment;
        uint256 blockedBalance;
        OfferTerms terms;
        Status status;
    }
}
