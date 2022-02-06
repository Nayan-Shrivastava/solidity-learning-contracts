// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// pure does not view nor modify state. i.e. it can only use what is provided to it to run. 
// view cannot modify state, but can look it up.
// if a function modifies a state it's neither view nor pure.

contract ViewAndPureFunctions {
    uint public num;
    function viewFunc() external view returns (uint) {
        return num;
    }
    function pureFunc() external pure returns (uint){
        return 1;
    }

    function addToNum(uint x) external view returns (uint){
        return num + x;
    }
    function add(uint x, uint y) external pure returns (uint){
        return x+y;
    }
}