// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Import Statements
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// Events

// Errors: {contractName__error}


// Contracts
/// @title 
/// @author 
/// @notice 
/// @dev 
/// @custom:experimental 
contract ERC20MOCK is ERC20 {
    // Constructor
    constructor() ERC20("Project", "Pro") {
        
    }

    // // Functions
    function mint(address user, uint256 amount) public {
        _mint(user, amount);
    }
}