// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ErrorHandelling {

    uint256 public balance;

    error DivisionByZeroError();

    error ConditionNotMet(string message);

    constructor(uint initBalance) payable {
        require(initBalance >= 0, "Initial balance cannot be negative");
        balance = initBalance;
    }

    function getBalance() public view returns(uint256) {
        return balance;
    }

    function array_sum(uint[] memory array) public {
        require(array.length > 0, "Array cannot be empty");
        uint256 result = 0;
        for (uint i = 0; i < array.length; i++) {
            result += array[i];
        }
        balance = result;
    }

    function array_product(uint[] memory array) public {
        require(array.length > 0, "Array cannot be empty");
        uint256 result = 1;
        for (uint i = 0; i < array.length; i++) {
            require(result <= type(uint256).max / array[i], "Integer overflow");
            result *= array[i];
        }
        balance = result;
    }

    function incrementBalanceBy(uint amount) public {
        balance += amount;
    }

    function setBalanceToHalfIfAbove(uint threshold) public {
        if (balance > threshold) {
            balance /= 2;
        }
    }
}
