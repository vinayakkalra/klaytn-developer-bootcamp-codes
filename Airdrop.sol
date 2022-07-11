// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Airdrop {

    mapping ( address => bool) airdropAddresses;
    uint256 airdrop_amount = 1 * 10**18; // equivalent to 10 klay
    address owner;
    uint256 balance = 0;

    constructor() {
      owner = msg.sender;
    }

    function airdrop() public {
        if(airdropAddresses[msg.sender] == false && balance >= airdrop_amount){
            payable(msg.sender).transfer(airdrop_amount);
            balance = balance - airdrop_amount;
            airdropAddresses[msg.sender] = true;
        }
    }

    function hasAirdropped(address _address) public view returns(bool){
        return airdropAddresses[_address];
    }

    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }

    function deposit() onlyOwner public payable {
        balance = balance + msg.value;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

}
