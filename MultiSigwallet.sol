// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract MultiSigWallet {
    event Deposit(address indexed sender , uint amount);
    event Submit(uint indexed txId);
    event Approve(address indexed owner, uint indexed txId);
    event Revoke(address indexed owner, uint indexed txId);
    event Execute(uint indexed txId);

    struct Transaction{
        address to;
        uint value;
        bytes data;
        bool executed;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;

    uint public required;

    Transaction[] public  transactions;
    mapping(uint => mapping(address => bool)) public approved;

    constructor(address[] memory _owners, uint _required ){
        require(_owners.length > 0, "owners required");
        require(_required > 0 && _required <= _owners.length, "invalid required number of owners");

        for(uint i; i < _owners.length; i++){
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");
            owners.push(owner);
            isOwner[owner] = true;
        }
        required = _required;
    }

    modifier onlyOwner(){
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint txId){
        require(txId < transactions.length, "transaction doesn't exist");
        _;
    }

    modifier notApproved(uint txId){
        require(!approved[txId][msg.sender], "transaction already approved");
        _;
    }

     modifier notExecuted(uint txId){
        require(!transactions[txId].executed, "transaction already executed");
        _;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submit(address _to, uint _value, bytes calldata _data) external onlyOwner {
        transactions.push(Transaction(_to, _value, _data, false));
        emit Submit(transactions.length - 1);
    }

    function approve(uint txId) external onlyOwner txExists(txId) notApproved(txId) notExecuted(txId) {
        approved[txId][msg.sender] = true;
        emit Approve(msg.sender, txId);
    }

    function _getApprovalCount(uint _txId) private view returns (uint count) {
        for(uint i; i< owners.length; i++) {
            count += approved[_txId][owners[i]] ? 1 : 0;
        }
    }
    function execute(uint txId) external txExists(txId) notExecuted(txId){
        require(_getApprovalCount(txId) >= required, "approval < required");

        Transaction storage transaction = transactions[txId];
        transaction.executed = true;

        (bool success, ) = transaction.to.call{value : transaction.value}(transaction.data);
        require(success, "tx failed");
        emit Execute(txId);
    }

    function revoke(uint _txId) external onlyOwner txExists(_txId) notExecuted(_txId){
        require(approved[_txId][msg.sender], "tx not approved");
        approved[_txId][msg.sender] = false;
        emit Revoke( msg.sender,_txId);
    }
}