// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract statevariable {
    uint public myUint = 123;

    function foo() external {
        uint notStatevariable = 456;
    }

}