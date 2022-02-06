// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HelloWorld{
    string public myString = "Hello Worlds";
    bool public b = true;
    uint public u = 123; // uint = uint256 0 to 2**256
                         //        uint8   0 to 2**8  
                         //        uint16  0 to 2*816                  
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0xc0ffee254729296a45a3885639AC7E10F9d54979;
    bytes32 public b32 = 0x7465737400000000000000000000000000000000000000000000000000000000;
}
