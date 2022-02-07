// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
A calls B sends 100 wei 
        B call C, sends 50 wei
A --- > B --- > Call
            msg.sender = B
            msg.value  = 50
            execute code on C's state variables
            use ETH in C

A calls B sends 100 wei 
        B delegateCall C
            msg.sender = A
            msg.value  = 100
            execute code on B's state variables
            use ETH in B

*/