// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EtherWallet {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdrawal(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getbalance() external view returns( uint ){
        return address(this).balance;
    }
    
}