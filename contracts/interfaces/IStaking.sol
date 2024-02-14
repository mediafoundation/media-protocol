// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IStaking {
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    function WETH9() external view returns (address);
    function factory() external view returns (address);
    function marketplace() external view returns (address);
    function nftIds(uint256, address) external view returns (uint256);
    function owner() external view returns (address);
    function positionManager() external view returns (address);
    function recoverNative() external returns (bool);
    function renounceOwnership() external;
    function stakes(uint256, address) external view returns (uint256);
    function token() external view returns (address);
    function transferOwnership(address newOwner) external;
    function setMarketplace(address _marketplace) external returns (bool);
    function setMediaToken(address _tokenAddress) external returns (bool);
    function setNonfungiblePositionManager(
        address _positionManager
    ) external returns (bool);
    function getMarketplace() external view returns (address addr);
    function recoverTokens(address _token) external returns (bool);
    function stake(
        uint256 marketplaceId,
        uint256 nftId
    ) external returns (bool);
    function unstake(uint256 marketplaceId) external returns (uint256 nftId);
    function increaseLiquidity(
        uint256 marketplaceId,
        uint256 amountWETH,
        uint256 amountMediaToken,
        uint256 slippage
    ) external returns (uint128 liquidity, uint256 amount0, uint256 amount1);
    function decreaseLiquidity(
        uint256 marketplaceId,
        uint128 newLiquidity,
        uint256 amountWETH,
        uint256 amountMediaToken
    )
        external
        returns (
            uint256 amount0,
            uint256 amount1,
            address token0,
            address token1
        );
    function getNftId(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256 nftId);
    function getStakeAmount(
        uint256 marketplaceId,
        address provider
    ) external view returns (uint256 liquidity);
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4);
}
