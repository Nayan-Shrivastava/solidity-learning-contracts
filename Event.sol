// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    event Log(string message, uint val);
    // upto 3 indexes, index help to search for event based on values
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("Foo", 123);
        emit IndexedLog(msg.sender, 789);
    }
    event Message(address indexed _from, address indexed _to, string message);
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}