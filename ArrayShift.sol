// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    uint[] public arr;

    function example() public {
        arr = [1,2,3];
        delete arr[1]; // [1, 0, 3]
    }

    function remove(uint _index) public {
        require(_index < arr.length, "invalid index");

        for(uint i = _index + 1; i < arr.length; i++){
            arr[i-1] = arr[i];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1,2,4,5]
        require(arr[0] == 1,"arr[0] == 1");
        require(arr[1] == 2, "arr[0] == 2");
        require(arr[2] == 4, "arr[0] == 4");
        require(arr[3] == 5, "arr[0] == 5");

        arr = [1];

        remove(0);
        require(arr.length == 0,"length == 0");


    }
}