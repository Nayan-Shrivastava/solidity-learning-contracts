// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// order of inheritance - most base-like - contract which inherits least (is a child class least no. of time


contract X{
    function foo() public pure virtual returns (string memory) {
        return "X";
    }
    function bar() public pure virtual returns (string memory){
        return "X";
    }
    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X{
    function foo() public pure virtual override returns (string memory) {
        return "y";
    }
    function bar() public pure virtual override returns (string memory){
        return "y";
    }
    function y() public pure returns (string memory) {
        return "y";
    }
}

contract Z is X, Y{ // specify in most base-lik order only else compilation error
    function foo() public pure virtual override(X, Y) returns (string memory) {
        return "z";
    }
    function bar() public pure virtual override(Y, X) returns (string memory){
        return "z";
    }
    function z() public pure returns (string memory) {
        return "z";
    }
}