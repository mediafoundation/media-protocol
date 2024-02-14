// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IDisputes {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
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
    function owner() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function transferOwnership(address newOwner) external;
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
    function setMaxDisputeDuration(uint256 _maxDisputeDuration) external;
    function getMarketplace() external view returns (address);
    function setMarketplace(address _marketplace) external;
    function recoverTokens(address _token) external returns (bool);
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
