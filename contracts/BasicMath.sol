// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BasicMath {

function adder (uint _a, uint _b) public pure returns (uint sum, bool error) {
    unchecked { 
        uint _c = _a + _b;
        if (_c < _a) {
            sum = 0;
            error = true;
        } else {
            sum = _c;
            error = false;
        }
    return(sum, error); 
    }
}

function subtractor (uint _a, uint _b) public pure returns (uint difference, bool error) {
    unchecked {
        uint _c = _a - _b;
        if (_c > _a) {
            difference = 0;
            error = true;
        } else {
            difference = _c;
            error = false;
        }
        return(difference, error);
    }
}

}