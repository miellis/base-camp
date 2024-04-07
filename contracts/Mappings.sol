// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract FavoriteRecords {
    mapping (string => bool) public approvedRecords;
    mapping (address => string[]) userFavorites;
    string[9] approvedRecordsList = ["Thriller", "Back in Black", "The Bodyguard", "The Dark Side of the Moon", 
        "Their Greatest Hits (1971-1975)", "Hotel California", "Come On Over", "Rumours", "Saturday Night Fever"];

    constructor() {
        for (uint i = 0; i<approvedRecordsList.length; i++) {
            approvedRecords[approvedRecordsList[i]] = true;
        }
    }

    function getApprovedRecords() external view returns (string[] memory) {
        string[] memory RecordsList = new string[](approvedRecordsList.length);
        for (uint i = 0; i<approvedRecordsList.length; i++) {
            RecordsList[i] = approvedRecordsList[i];
        }
        return RecordsList;
    }

    error NotApproved(string _album);
    function addRecord(string calldata _album) external {
        if (!approvedRecords[_album]) {
            revert NotApproved(_album);
        }
        userFavorites[msg.sender].push(_album);
    }

    function getUserFavorites(address _address) external view returns (string[] memory) {
        return userFavorites[_address];
    }

    function resetUserFavorites () external {
        delete userFavorites[msg.sender];
    }

}