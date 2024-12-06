// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract BankDetails {

    struct Customer {
        string name;
        uint8 accountNo;
        uint256 accountBalance;
    }

    Customer[] public customerDetails;
    mapping(uint8 => string) public accountNoToName;
    mapping(uint8 => uint256) public accountNoToAccountBalance;
    mapping(uint8 => bool) public accountExists;
    mapping(uint8 => uint256) private accountNoToIndex;

    function storeAccountDetails(string memory _name, uint8 _accountNo, uint256 _accountBalance) public {

        require(!accountExists[_accountNo], 'Account does not exists!');

        Customer memory newCustomer = Customer(_name, _accountNo, _accountBalance);
        customerDetails.push(newCustomer);
        accountNoToName[_accountNo] = _name;
        accountNoToAccountBalance[_accountNo] = _accountBalance;
        accountExists[_accountNo] = true;

        accountNoToIndex[_accountNo] = customerDetails.length -1;

    }

    function depositFund(uint8 _accountNo, uint256 _depositAmount) public {
        require(accountExists[_accountNo], 'Account Does not exist!');
        
        accountNoToAccountBalance[_accountNo] += _depositAmount;

        customerDetails[accountNoToIndex[_accountNo]].accountBalance += _depositAmount;
    }

    function fetchIndividualAccountDetails(uint8 _accountNo) public view returns (Customer memory) {
        require (accountExists[_accountNo], 'Account does not exists!');

            uint256 customerIndex = accountNoToIndex[_accountNo];
            return customerDetails[customerIndex];
    }
}