// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract SimpleStorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorage() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
    }

    function sfStore(uint256 _simpleStorageContractIndex, uint256 _simpleStorgeNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageContractIndex];
        mySimpleStorage.store(_simpleStorgeNumber);
    }

    function sfGet(uint _simpleStorageContractIndex) public view returns (uint256) {
        SimpleStorage myStorageNumber = listOfSimpleStorageContracts[_simpleStorageContractIndex];
        return myStorageNumber.retrieve();
    }
}