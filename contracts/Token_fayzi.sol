// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token_Fayzi{
// state variables
    address public owner;
    mapping (address=>uint) public balances;

//error functions 
    error Balance_Insufficient(uint amount_requst, uint balance_available);
//modefiers
    modifier OnlyOwner(){
        require(msg.sender== owner, "Only the owner can access this function");
        _;
    }
//events
    event Send_Event(address from, address to , uint amount);
//constructors
    constructor() {
        owner = msg.sender;
    }

//functions
    function Owner(address receiver , uint amount)
    public
    OnlyOwner{
        balances[receiver] += amount;
    }

     function Send(address receiver, uint amount)
     public 
     {
        if(amount>balances[msg.sender])
        //revert Balance_Insufficient(amount,balances[msg.sender]);
        revert("Account balance is insufficient");

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Send_Event(msg.sender, receiver, amount);
     }



}