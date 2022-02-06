// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/*
1.
     E
   /   \
  F     G
   \   /
     H
 
 Graph of inheritance

    A
   / \
  B   C
 / \ /
F  D,E

*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }
    function bar() public virtual {
        emit Log("E.bar");
    }
}


contract F is E{

    function foo() public virtual override {
        emit Log("F.foo");
        E.foo(); // will call foo() on parent function
    }
    function bar() public virtual override {
        emit Log("F.bar");
        super.bar();
    }
}

contract G is E{

    function foo() public virtual override {
        emit Log("G.foo");
        E.foo(); // will call foo() on parent function
    }
    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is G, F{

    function foo() public virtual override(F,G) {
        emit Log("H.foo");
        E.foo(); // will call foo() on E function
    }
    function bar() public virtual override(F,G) {
        emit Log("H.bar");
        super.bar(); // will call foo() on all parents
    }
}