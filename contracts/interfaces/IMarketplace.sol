// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplace {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error ReentrancyGuardReentrantCall();
    error SafeERC20FailedOperation(address token);
    event AddedBalance(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _amount
    );
    event BillingStartExtended(
        uint256 marketplaceId,
        uint256 dealId,
        uint256 _extension
    );
    event DealAccepted(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _amount
    );
    event DealCancelled(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _paymentToProvider,
        uint256 _totalPayment,
        uint256 _clientRefund
    );
    event DealCollected(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _paymentToProvider,
        uint256 _totalPayment
    );
    event DealCreated(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _amount,
        bool _autoAccept
    );
    event DealRejected(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _clientRefund
    );
    event OfferCreated(uint256 _marketplaceId, uint256 _offerId);
    event OfferDeleted(uint256 _marketplaceId, uint256 _offerId);
    event OfferUpdated(uint256 _marketplaceId, uint256 _offerId);
    event ProviderRegistered(uint256 _marketplaceId, address _provider);
    event ProviderStakeDecreased(
        uint256 _marketplaceId,
        address _provider,
        uint256 _amount0,
        uint256 _amount1
    );
    event ProviderStakeIncreased(
        uint256 _marketplaceId,
        address _provider,
        uint256 _liquidity,
        uint256 _amount0,
        uint256 _amount1
    );
    event ProviderUnregistered(uint256 _marketplaceId, address _provider);
    event ProviderUpdated(uint256 _marketplaceId, address _provider);
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
    function dealAutoIncrement(uint256) external view returns (uint256);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(bytes32 role, address account) external;
    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);
    function offerAutoIncrement(uint256) external view returns (uint256);
    function offerCounter(uint256) external view returns (uint256);
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
    function registerProvider(
        uint256 marketplaceId,
        string memory metadata,
        string memory publicKey,
        uint256 nftId
    ) external returns (bool);
    function unregisterProvider(
        uint256 marketplaceId
    ) external returns (uint256 nftId);
    function updateProvider(
        uint256 marketplaceId,
        string memory metadata,
        string memory publicKey
    ) external returns (bool updated);
    function increaseProviderStake(
        uint256 marketplaceId,
        uint256 amountWeth,
        uint256 amountMedia,
        uint256 slippage
    ) external returns (uint128 liquidity, uint256 amount0, uint256 amount1);
    function decreaseProviderStake(
        uint256 marketplaceId,
        uint128 newLiquidity,
        uint256 amountWeth,
        uint256 amountMedia
    ) external returns (bool);
    function createOffer(
        uint256 marketplaceId,
        uint256 maximumDeals,
        bool autoAccept,
        uint256 pricePerSecond,
        uint256 minDealDuration,
        bool billFullPeriods,
        bool singlePeriodOnly,
        string memory metadata
    ) external returns (uint256 offerId);
    function updateOffer(
        uint256 marketplaceId,
        uint256 offerId,
        uint256 maximumDeals,
        bool autoAccept,
        uint256 pricePerSecond,
        uint256 minDealDuration,
        bool billFullPeriods,
        bool singlePeriodOnly,
        string memory metadata
    ) external returns (bool);
    function deleteOffer(
        uint256 marketplaceId,
        uint256 offerId
    ) external returns (bool);
    function acceptDeal(
        uint256 marketplaceId,
        uint256 dealId
    ) external returns (bool);
    function rejectDeal(
        uint256 marketplaceId,
        uint256 dealId
    ) external returns (bool);
    function createDeal(
        uint256 marketplaceId,
        uint256 resourceId,
        uint256 offerId,
        uint256 blockedBalance,
        string memory sharedKeyCopy
    ) external returns (uint256 dealId, uint256 actualDeposit);
    function createDeals(
        uint256 marketplaceId,
        uint256 resourceId,
        uint256[] memory offerIds,
        uint256[] memory blockedBalance,
        string[] memory _sharedKeyCopies
    ) external returns (uint256[] memory dealsId, uint256 totalDeposit);
    function cancelDeal(
        uint256 marketplaceId,
        uint256 dealId
    ) external returns (bool);
    function cancelAllDeals(
        uint256 marketplaceId,
        uint256 resourceId
    ) external returns (bool);
    function addBalance(
        uint256 marketplaceId,
        uint256 dealId,
        uint256 blockedBalance
    ) external returns (uint256 actualDeposit);
    function collectDeal(
        uint256 marketplaceId,
        uint256 dealId
    ) external returns (bool);
    function collectAllDeals(uint256 marketplaceId) external returns (bool);
    function extendBillingStart(
        uint256 marketplaceId,
        uint256 dealId,
        uint256 extension
    ) external returns (bool);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
    function hasActiveDeals(
        uint256 marketplaceId,
        uint256 offerId
    ) external view returns (bool);
    function isRegisteredProvider(
        uint256 marketplaceId,
        address provider
    ) external view returns (bool);
    function getProvider(
        uint256 marketplaceId,
        address provider
    ) external view returns (Marketplace.Provider memory);
    function getOffer(
        uint256 marketplaceId,
        uint256 offerId
    ) external view returns (Marketplace.Offer memory);
    function getDeal(
        uint256 marketplaceId,
        uint256 dealId
    ) external view returns (Marketplace.Deal memory);
    function getProviderOffers(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256[] memory);
    function getOfferDealsIds(
        uint256 marketplaceId,
        uint256 offerId
    ) external view returns (uint256[] memory);
    function getClientDeals(
        uint256 marketplaceId,
        address client
    ) external view returns (uint256[] memory);
    function getProviderDeals(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256[] memory);
    function getStakeAmount(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256);
}

interface Marketplace {
    struct Provider {
        string metadata;
        string publicKey;
    }

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
