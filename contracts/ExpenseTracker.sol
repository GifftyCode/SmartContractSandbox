// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        uint256 amount;
        string description;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, 50, 'Rent'));
        expenses.push(Expense(msg.sender, 20, 'Fee'));
        expenses.push(Expense(msg.sender, 100, 'Savings'));
    }

    function addExpense(uint256 _amount, string memory _description) external {
        expenses.push(Expense(msg.sender, _amount, _description));
    }

    function getAllExpenses(address _user) external view returns(uint) {
        uint256 totalExpenses;
        for (uint i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                totalExpenses += expenses[i].amount;
            }
            return totalExpenses;
        }
    }
}