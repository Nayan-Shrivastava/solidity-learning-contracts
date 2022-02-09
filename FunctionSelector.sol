// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FunctionSelector {
    // func = "transfer(address,uint256)"
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func))); // 0xa9059cbb
    }
}

contract receiver {
        event Log(bytes data);
    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);
        // 0xa9059cbb - first 4 bytes contain function - function selector - first 4 bytes of hash of function signature
        // 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc
        // 4000000000000000000000000000000000000000000000000000000000000000b
    }
}