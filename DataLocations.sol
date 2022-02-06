// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Data locations
// storage - state variables
// memory - variables loaded on memory
// calldata - like memory but only for function inputs
// calldata can't be modified so saves gas
contract DataLocations {
    
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo : 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text ="foo";
        MyStruct memory readOnly = myStructs[msg.sender]; // volatile
        readOnly.text ="foo";
        uint[] memory memArr= new uint[](2);
        memArr[0] = 234;
        return memArr;

        _internal(y); // will not copy the whole array and will pass by reference, therefore saves gas
        
    }

    function _internal(uint[] calldata _y) private {
        uint x = _y[0]; 
    }
}