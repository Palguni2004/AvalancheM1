// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ErrorHandling {

    uint256 public balance;

    // Custom error definitions
    error DivisionByZeroError();
    error ConditionNotMet(string message);
    error IntegerOverflowError();

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
            // Check for overflow
            uint256 tempResult = result + array[i];
            assert(tempResult >= result); // Check invariant: no overflow
            result = tempResult;
        }
        balance = result;
    }

    function array_product(uint[] memory array) public {
        require(array.length > 0, "Array cannot be empty");
        uint256 result = 1;
        for (uint i = 0; i < array.length; i++) {
            if (result != 0 && array[i] != 0) {
                require(result <= type(uint256).max / array[i], "Integer overflow");
            }
            result *= array[i];
        }
        balance = result;
    }

    function incrementBalanceBy(uint amount) public {
        uint256 newBalance = balance + amount;
        assert(newBalance >= balance); // Check invariant: no overflow
        balance = newBalance;
    }

    function setBalanceToHalfIfAbove(uint threshold) public {
        if (balance > threshold) {
            uint256 newBalance = balance / 2;
            // Add an assert to ensure balance is reduced
            assert(newBalance < balance);
            balance = newBalance;
        } else {
            revert ConditionNotMet("Balance is not above the specified threshold.");
        }
    }
}
