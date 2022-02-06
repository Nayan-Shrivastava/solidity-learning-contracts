// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FunctionModifier{
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }
    modifier whenNotPaused(){
        require(!paused, "Paused");
        _; // calls the wrapped function
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    // modifier With input
    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    // sandwich

    modifier sandwich(){
        // code here
        count += 10;
        _; // will call foo()
        //more code here
        count += 10;
    }

    function foo() external sandwich {
        count += 1;
    }

}