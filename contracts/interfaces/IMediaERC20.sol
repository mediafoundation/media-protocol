// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

interface IMediaERC20 {
    error InvalidShortString();
    error StringTooLong(string str);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event DelegateChanged(
        address indexed delegator,
        address indexed fromDelegate,
        address indexed toDelegate
    );
    event DelegateVotesChanged(
        address indexed delegate,
        uint256 previousBalance,
        uint256 newBalance
    );
    event EIP712DomainChanged();
    event Transfer(address indexed from, address indexed to, uint256 value);
    function CLOCK_MODE() external view returns (string memory);
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function burn(uint256 amount) external;
    function burnFrom(address account, uint256 amount) external;
    function checkpoints(
        address account,
        uint32 pos
    ) external view returns (ERC20Votes.Checkpoint memory);
    function clock() external view returns (uint48);
    function decimals() external view returns (uint8);
    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) external returns (bool);
    function delegate(address delegatee) external;
    function delegateBySig(
        address delegatee,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
    function delegates(address account) external view returns (address);
    function eip712Domain()
        external
        view
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        );
    function getPastTotalSupply(
        uint256 timepoint
    ) external view returns (uint256);
    function getPastVotes(
        address account,
        uint256 timepoint
    ) external view returns (uint256);
    function getVotes(address account) external view returns (uint256);
    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) external returns (bool);
    function name() external view returns (string memory);
    function nonces(address owner) external view returns (uint256);
    function numCheckpoints(address account) external view returns (uint32);
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

interface ERC20Votes {
    struct Checkpoint {
        uint32 fromBlock;
        uint224 votes;
    }
}
