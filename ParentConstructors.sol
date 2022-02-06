// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//2 ways to call parent contructors

// order of initialization

contract S {
    string public name;

    constructor( string memory _name){
        name = _name;
    }
}

contract T {
    string public text;

    constructor (string memory _text) {
        text = _text;
    }
}

// Order of execution
// S
// T
// U
contract U is S("s"), T("t") { // 1st way
    
}

// Order of execution
// S
// T
// V
contract V is S, T {
    constructor (string memory _name, string memory _text) T(_text) S(_name) {

    }
}

// Order of execution
// S
// T
// VV
contract VV is S("s"), T {
    constructor (string memory _name, string memory _text) T(_text){
        
    }
}

// Order of execution
// T
// S
// VV
contract W is T, S {
    constructor (string memory _name, string memory _text) T(_text) S(_name) {

    }
}
