// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// abi.encode = encode into bytes
//abi.encodePacked = encode into bytes but compressed therefore some information is reduced
contract HashFunc {
    function hash(string memory text, uint num, address addr) external pure returns (bytes32){
        return keccak256(abi.encodePacked(text, num, addr)); // takes bytes
    }

    function encode(string memory text0,string memory text1) external pure returns (bytes memory){
        return abi.encode(text0, text1); // "AAA", "BBB" -  0x000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000034242420000000000000000000000000000000000000000000000000000000000
    }

    function encodePacked(string memory text0,string memory text1) external pure returns (bytes memory){
        return abi.encodePacked(text0, text1); // "AAA", "BBB" - 0x414141424242
    }

    // hash collision in encodePacked for ("AAAA", "BBB") and ("AAA", "ABBB")

    function collision(string memory text0 ,string memory text1) external pure returns (bytes32){
        return keccak256(abi.encodePacked(text0, text1)); // collision - same hash for ("AAAA", "BBB") and ("AAA", "ABBB") -  0x11db58448f2a53848bef361744f19e6fdabef68b8267b1ff669de1b4c42da0da
    }
    // solution 1. use abi.encode, 2. avoid dynamic inputs near each other 
}