// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;



// Lets Create A Contract for Our Application
contract Transactions {
    // this will store the transaction count
    uint256 t_count;

    event Transfer(address from,address reciever,uint amount,string message,uint256 timestamp,string keyword);

    struct TransactionObject {
        address sender;
        address reciever;
        uint   amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransactionObject[] transactions;

    function addToBlockChain(address payable reciever , uint amount,string memory message , string memory keyword) public{
        t_count+=1;
        transactions.push(TransactionObject(msg.sender,reciever,amount,message,block.timestamp,keyword));
        emit Transfer(msg.sender, reciever, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public view returns (TransactionObject[] memory){
        // It will return the transactions
        return transactions;

    }
    function getAllTransactionsCount() public view returns (uint256){
        // It will return the transactions
        return t_count;
    }

}