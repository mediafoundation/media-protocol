// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplaceViewer {
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
