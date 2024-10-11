// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IStaking {
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
    function WETH9() external view returns (address);
    function factory() external view returns (address);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(bytes32 role, address account) external;
    function hasRole(
        bytes32 role,
        address account
    ) external view returns (bool);
    function marketplace() external view returns (address);
    function nftIds(uint256, address) external view returns (uint256);
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
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function token() external view returns (address);
    receive() external payable;
    function setMarketplace(address _marketplace) external returns (bool);
    function getMarketplace() external view returns (address);
    function setMediaToken(address _tokenAddress) external returns (bool);
    function setNonfungiblePositionManager(
        address _positionManager
    ) external returns (bool);
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
    function recoverERC20(address _token) external returns (bool);
    function recoverERC721(
        address _token,
        uint256 _tokenId
    ) external returns (bool);
}
