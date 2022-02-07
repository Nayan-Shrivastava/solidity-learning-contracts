// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


// useful when you want to call functions from other contracts for which you don't have code
interface ICounter {
    function count() external view returns (uint);
    function inc() external;
}
contract CallInterface {
    uint public count;
    function examples (address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}