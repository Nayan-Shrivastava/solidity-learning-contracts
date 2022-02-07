// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Payable {
    address payable public  owner; // can never send Ether

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable { }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}