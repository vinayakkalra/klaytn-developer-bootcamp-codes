// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Airdrop {

    mapping ( address => bool) airdropAddresses;
    uint256 airdrop_amount = 10 * 10**18; // equivalent to 10 klay

    function airdrop() public {
        if(airdropAddresses[msg.sender] == false){
            payable(msg.sender).transfer(airdrop_amount);
            airdropAddresses[msg.sender] = true;
        }
    }

    function hasAirdropped(address _address) public view returns(bool){
        return airdropAddresses[_address];
    }
}
