// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMarketplaceHelper {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    function marketplace() external view returns (address);
    function mediaToken() external view returns (address);
    function owner() external view returns (address);
    function positionManager() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function router() external view returns (address);
    function transferOwnership(address newOwner) external;
    function weth() external view returns (address);
    function wethToken() external view returns (address);
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
    function recoverTokens(address _token) external returns (bool);
    function sortAddresses(
        address a,
        address b
    ) external pure returns (address, address);
    function addLiquidityAndRegisterWithETH(
        uint256 marketplaceId,
        string memory label,
        string memory publicKey,
        uint256 minMediaAmountOut,
        bytes memory path,
        uint256 slippage
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
        string memory label,
        string memory publicKey,
        uint256 minWethAmountOut,
        uint256 minMediaAmountOut,
        bytes[] memory paths,
        uint256 slippage
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
    ) external returns (uint256 collectedToken0, uint256 collectedToken1);
    function unregisterRemoveLiquidityAndSwap(
        uint256 marketplaceId,
        uint256 minMediaAmount,
        uint256 minWethAmount
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
}
