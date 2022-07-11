// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {

    uint256 number;
    uint256 count = 0;
    address latest_address;
    mapping ( address => uint256) latestAddressChanges;

    function store(uint256 num) public {
        number = num;
        count = count + 1;
        latest_address = msg.sender;
        latestAddressChanges[msg.sender] = num;
    }

    function retrieve() public view returns (uint256){
        return number;
    }

    function getCount() public view returns (uint256){
        return count;
    }

    function getLatestAddress() public view returns (address){
        return latest_address;
    }

    function retrieveLatestChangesByAddress(address _address) public view returns (uint256){
        return latestAddressChanges[_address];
    }
}
