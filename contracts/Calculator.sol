// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Make a contract called Calculator
// 2️⃣ Create Result variable to store result
// 3️⃣ Create functions to add, subtract, and multiply to result
// 4️⃣ Create a function to get result

contract Calculator {
    uint256 result;

    function add(uint256 num) external {
        result += num;
    }

    function subtract(uint256 num) external {
        result -= num;
    }

    function multiply(uint256 num) external {
        result *= num;
    }

    function divide(uint256 num) external {
        result /= num;
    }

    function getResult() public view returns(uint256) {
        return  result;
    }

    function reset() public {
        result = 0;
    }

}
