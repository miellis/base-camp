// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    function getNumbers () external view returns (uint[] memory) {
        return numbers;
    }

    function resetNumbers () external {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appendToNumbers (uint[] calldata _toAppend) external {
        uint newLength = numbers.length + _toAppend.length;
        uint[] memory newArray = new uint[](newLength);

        for (uint i; i < numbers.length; i++){
            newArray[i] = numbers[i];
        }

        for (uint i; i < _toAppend.length; i++){
            newArray[numbers.length + i] = _toAppend[i];
        }

        numbers = newArray;
    } 

    function saveTimestamp (uint _unixTimestamp) external {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K () external view returns (uint[] memory, address[] memory) {
        uint amountAfter;
        for (uint i; i < timestamps.length; i++){
            if (timestamps[i] > 946702800){
                amountAfter++;
            }
        }

        uint[] memory timestampsAfter = new uint[](amountAfter);
        address[] memory sendersAfter = new address[](amountAfter);
        uint afterIdx;
        for (uint i; i < timestamps.length; i++){
            if (timestamps[i] > 946702800){
                timestampsAfter[afterIdx] = timestamps[i];
                sendersAfter[afterIdx] = senders[i];
                afterIdx++;
            }
        }

        return (timestampsAfter, sendersAfter);
    }

    function resetSenders() external {
        delete senders;
    }

    function resetTimestamps() external {
        delete timestamps;
    }
}

