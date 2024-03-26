// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract EmployeeStorage {
    uint16 private shares;
    uint24 private salary;
    uint256 public idNumber;
    string public name;

    error TooManyShares(uint totalShares);

    // 1000, 50000, 112358132134, Pat
    constructor(uint16 _shares, uint24 _salary, uint256 _idNumber, string memory _name){
        shares = _shares;
        salary = _salary;
        idNumber = _idNumber;
        name = _name;
    }

    function viewSalary() public view returns(uint32) {
        return salary;
    }

    function viewShares() public view returns(uint32) {
        return shares;
    }

    function grantShares(uint16 _newShares) public {
        uint16 totalShares = shares + _newShares;
        require(_newShares < 5001, "Too many shares");
        if (totalShares > 5000) {
            revert TooManyShares(totalShares);
        }
        shares = totalShares;
    }

    // Unit test functions
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    function debugResetShares() public {
        shares = 1000;
    }

}