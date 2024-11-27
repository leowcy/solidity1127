// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Import Statements
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// Events

// Errors: {contractName__error}

// Contracts
/// @title
/// @author
/// @notice
/// @dev
/// @custom:experimental
contract Project is ERC20 {
    // Type Declarations
    // struct  {

    // }

    // State Variables
    address userAddress;
    address owner;
    // address[] users;
    mapping(address => uint256) userAddressToAmount;
    IERC20 i_usdtAddress;

    // Events
    event UserDeposit(address userAddress, uint256 amount);
    event UserRedeem(address userAddress, uint256 amount);

    // Errors
    error Project__NotOwner();
    error Project__NotEnoughBalanceForRedeem();
    error Project__TranferFailed();

    // Modifiers
    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert Project__NotOwner();
        }
        _;
    }

    // Constructor
    constructor(address _usdcAddress) ERC20("Project", "PRO") {
        i_usdtAddress = IERC20(_usdcAddress);
        owner = msg.sender;
    }

    // Functions
    function deposit(address _userAddress, uint256 amount) public {
        userAddressToAmount[_userAddress] += amount;
        bool success = i_usdtAddress.transferFrom(_userAddress, address(this), amount);
        if (!success) {
            revert Project__TranferFailed();
        }
        emit UserDeposit(_userAddress, amount);
    }

    function getDeposit(address _userAddress) public view returns (uint256) {
        return userAddressToAmount[_userAddress];
    }

    function redeem(address _userAddress, uint256 redeemAmount) public onlyOwner {
        if (redeemAmount > userAddressToAmount[_userAddress]) {
            revert Project__NotEnoughBalanceForRedeem();
        }

        userAddressToAmount[_userAddress] -= redeemAmount;

        bool success = i_usdtAddress.transferFrom(address(this), _userAddress, redeemAmount);
        if (!success) {
            revert Project__TranferFailed();
        }

        emit UserRedeem(_userAddress, redeemAmount);
    }
}
