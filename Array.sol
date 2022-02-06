// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Array - dynamic or fixed size
// insert (push), get, update, delete, pop. length
// Creating array in memory
// Returning array from function
// 1 based indexing
contract Array {
    uint[] public nums = [1, 2, 3];
    uint[5] public fixedSizeNums = [4, 5, 6]; // number of elements during initialization can't be greater than max size

    function examples() external {
        nums.push(4); //[ 1, 2, 3, 4];
        uint x = nums[1]; // 2
        nums[2] = 777; // [1, 2, 777, 4];
        delete nums[1]; // [1, 0, 777, 4] // delete the values and sets it to default value, length remains same
        nums.pop(); // [1, 0, 777]


        // create array in memory
        uint[] memory a = new uint[](5); // must be fixed size
        a[1] = 123;
    }

    function returnArray() external view returns (uint[] memory){
        return nums; // returning array not recommended as it takes lot of gas if size is large
    }


}