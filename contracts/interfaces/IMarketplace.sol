// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplace {
    event AddedBalance(
        uint256 _marketplaceId,
        uint256 _dealId,
        uint256 _amount
    );
    event AddressAuthorized(address _addr);
    event AddressDeauthorized(address _addr);
    event BillingStartExtended(
        uint256 marketplaceId,
        uint256 dealId,
        uint256 _extension
    );
    event ClientUpdated(uint256 _marketplaceId, address _client);
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
    event MarketplaceInitialized(uint256 _marketplaceId);
    event OfferCreated(uint256 _marketplaceId, uint256 _offerId);
    event OfferDeleted(uint256 _marketplaceId, uint256 _offerId);
    event OfferUpdated(uint256 _marketplaceId, uint256 _offerId);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
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
    function REQUIRED_STAKE(uint256) external view returns (uint256);
    function authorizedAddresses(uint256) external view returns (address);
    function authorizedProxies(address) external view returns (bool);
    function dealAutoIncrement(uint256) external view returns (uint256);
    function marketFeeRate(uint256) external view returns (uint256);
    function marketFeeTo(uint256) external view returns (address);
    function marketplacesCounter() external view returns (uint256);
    function offerAutoIncrement(uint256) external view returns (uint256);
    function offerCounter(uint256) external view returns (uint256);
    function owner() external view returns (address);
    function owners(uint256) external view returns (address);
    function positionManager() external view returns (address);
    function protocolFeeRate() external view returns (uint256);
    function protocolFeeTo() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function transferOwnership(address newOwner) external;
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
    function initializeMarketplace(
        uint256 requiredStake,
        address _marketFeeTo,
        uint256 _marketFeeRate
    ) external returns (uint256 marketplaceId);
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
    function updateClient(
        uint256 marketplaceId,
        string memory metadata
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
    function authorizeProxy(address _addr) external returns (bool);
    function deAuthorizeProxy(address _addr) external returns (bool);
    function setToken(address _tokenAddress) external returns (bool);
    function setProtocolFeeTo(address feeTo) external returns (bool);
    function setProtocolFeeRate(uint256 feeRate) external returns (bool);
    function recoverTokens(address _token) external returns (bool);
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
    function getClient(
        uint256 marketplaceId,
        address client
    ) external view returns (string memory);
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
