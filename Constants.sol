// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000000; // 21442  saves gas for fetching state variables
    uint public constant MY_UINT = 123;
}
contract Var {
    address public MY_ADDRESS = 0x0000000000000000000000000000000000000000; // 23553 
}