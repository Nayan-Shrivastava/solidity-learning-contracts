// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Immutable {
    // address public owner = msg.sender; // 45718
    // address public immutable owner = msg.sender; // 43585 - less gas
    address public immutable owner;
   
    constructor(){
        owner = msg.sender;
    }
    
    uint public x;
    function foo() external {
        require(msg.sender == owner);
        x += 2;
    }
}