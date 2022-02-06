// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    // require, revert, assert
    // - gas refund, state updates are reverted
    // custom error - save gas
    // longer the error message, more the gas so custom error can be good to use

contract Error{
    // require example
    function testRequire(uint _i) public pure{
        require(_i <= 10, " i > 10"); // require( condition , error message if condition is false)
    }

    // revert
    function testRevert(uint _i) public pure{
        if( _i > 10){
            revert(" i > 10");
        }
    }

    // assert example
    uint public num = 123;

    function testAssert() public view{
        assert(num == 123);
    }

    function foo(uint _i) public {
        num += 1;
        require( _i <= 10, "i > 10" ); // when this error is thrown, changes done to num state var will be reverted
    }

    // custom error example
    error MyError(address caller, uint i);

    function testTestCustomError(uint _i) public view{
       if( _i > 10){
           revert MyError(msg.sender, _i);
       }
    }

}