// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {Project} from "../src/project.sol";
import {ERC20MOCK} from "./mocks/ERC20MOCK.sol";

contract TestProject is Test {

    ERC20MOCK usdcContract;
    Project project;

    address owner;
    address user1 = address(0x1);
    address user2 = address(0x2);


    function setUp() public {
        usdcContract = new ERC20MOCK();
        project = new Project(address(usdcContract));
    }

    function testDeposit() public {
        
        usdcContract.mint(user1, 1000);

        vm.prank(user1);
        usdcContract.approve(address(project), 1000);
        
        project.deposit(user1, 1000);
        assertEq(project.getDeposit(user1), 1000);
    }
}