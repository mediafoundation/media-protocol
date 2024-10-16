// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplaceHelper {
    error AccessControlBadConfirmation();
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);
    error AddressEmptyCode(address target);
    error AddressInsufficientBalance(address account);
    error FailedInnerCall();
    error ReentrancyGuardReentrantCall();
    error SafeERC20FailedOperation(address token);
    event OffersCreated(uint256 marketplaceId, uint256[] offerIds);
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
    function feeAmountTickSpacing(uint24) external view returns (int24);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(bytes32 role, address account) external;
    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);
    function marketplace() external view returns (address);
    function mediaToken() external view returns (address);
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
    function positionManager() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceRole(bytes32 role, address callerConfirmation) external;
    function revokeRole(bytes32 role, address account) external;
    function router() external view returns (address);
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function weth() external view returns (address);
    function wethToken() external view returns (address);
    receive() external payable;
    function tickSpacingToMaxTick(
        int24 tickSpacing
    ) external pure returns (int24 maxTick);
    function sortAddresses(
        address a,
        address b
    ) external pure returns (address, address);
    function addLiquidityAndRegisterWithETH(
        uint256 marketplaceId,
        string memory metadata,
        string memory publicKey,
        uint256[] memory minOut,
        bytes memory path,
        uint256 slippage,
        uint24 poolFee
    )
        external
        payable
        returns (
            uint256 nftId,
            uint128 liquidity,
            uint256 amount0,
            uint256 amount1
        );
    function addLiquidityAndRegister(
        uint256 marketplaceId,
        address inputToken,
        uint256 inputAmount,
        string memory metadata,
        string memory publicKey,
        uint256[] memory minOut,
        bytes[] memory paths,
        uint256 slippage,
        uint24 poolFee
    )
        external
        returns (
            uint256 nftId,
            uint128 liquidity,
            uint256 mediaAmount,
            uint256 wethAmount
        );
    function addLiquidityAndStakeWithETH(
        uint256 marketplaceId,
        uint256 minWethAmountOut,
        uint256 minMediaAmountOut,
        bytes memory path,
        uint256 slippage
    )
        external
        payable
        returns (uint128 liquidity, uint256 amount0, uint256 amount1);
    function addLiquidityAndStake(
        uint256 marketplaceId,
        address inputToken,
        uint256 inputAmount,
        uint256 minWethAmountOut,
        uint256 minMediaAmountOut,
        bytes memory path0,
        bytes memory path1,
        uint256 slippage
    ) external returns (uint128 liquidity, uint256 amount0, uint256 amount1);
    function unregisterRemoveLiquidity(
        uint256 marketplaceId,
        uint256 amount0Min,
        uint256 amount1Min
    )
        external
        returns (
            uint256 collectedToken0,
            uint256 collectedToken1,
            address token0,
            address token1
        );
    function unregisterRemoveLiquidityAndSwap(
        uint256 marketplaceId,
        uint256 minOutputMedia,
        uint256 minMediaAmount,
        uint256 minWethAmount,
        uint24 poolFee
    ) external;
    function swapAndCreateDeal(
        uint256 marketplaceId,
        address inputToken,
        uint256 inputAmount,
        uint256 resourceId,
        uint256 offerId,
        string memory sharedKeyCopy,
        uint256 minAmountOut,
        bytes memory path
    )
        external
        returns (uint256 mediaAmount, uint256 actualDeposit, uint256 dealId);
    function swapAndCreateDealWithETH(
        uint256 marketplaceId,
        uint256 resourceId,
        uint256 offerId,
        string memory sharedKeyCopy,
        uint256 minMediaAmountOut,
        bytes memory path
    )
        external
        payable
        returns (uint256 mediaAmount, uint256 actualDeposit, uint256 dealId);
    function swapAndCreateDeals(
        uint256 marketplaceId,
        address inputToken,
        uint256 inputAmount,
        uint256 resourceId,
        uint256[] memory offerIds,
        string[] memory sharedKeyCopies,
        uint256 minAmountOut,
        bytes memory path
    )
        external
        returns (
            uint256 mediaAmount,
            uint256 actualDeposit,
            uint256[] memory dealsId
        );
    function swapAndCreateDealsWithETH(
        uint256 marketplaceId,
        uint256 resourceId,
        uint256[] memory offerIds,
        string[] memory sharedKeyCopies,
        uint256 minMediaAmountOut,
        bytes memory path
    )
        external
        payable
        returns (
            uint256 mediaAmount,
            uint256 actualDeposit,
            uint256[] memory dealsId
        );
    function swapAndAddBalance(
        uint256 marketplaceId,
        address inputToken,
        uint256 inputAmount,
        uint256 dealId,
        uint256 minAmountOut,
        bytes memory path
    ) external returns (uint256 mediaAmount);
    function swapAndAddBalanceWithETH(
        uint256 marketplaceId,
        uint256 dealId,
        uint256 minMediaAmountOut,
        bytes memory path
    ) external payable returns (uint256 mediaAmount);
    function createOffers(
        uint256 marketplaceId,
        uint256[] memory maximumDealsArray,
        bool[] memory autoAcceptArray,
        uint256[] memory pricePerSecondArray,
        uint256[] memory minDealDurationArray,
        bool[] memory billFullPeriodsArray,
        bool[] memory singlePeriodOnlyArray,
        string[] memory metadataArray
    ) external returns (uint256[] memory);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
    function recoverERC20(address _token) external returns (bool);
}
