# Solidty Error Handelling
This Solidity program demonstrates error handling methods in smart contracts using the require, assert, and revert statements. These methods are essential for validating conditions and ensuring robust contract behavior.

## Contract Overview
The smart contract ErrorHandling includes three functions:

## require_method
1.`Parameters`: Takes two unsigned integers, x and y.

2.`Description`: Uses require to ensure x and y are both greater than zero, and that x is divisible by y.

3.`Error Handling`: If any condition fails, the function stops execution and reverts state changes. An optional error message is provided.

## assert_method
1.`Parameters`: Takes two unsigned integers, p and q.

2.`Description`: Uses assert to ensure p and q are both greater than zero, and that their product (p * q) is greater than their sum (p + q).
'
3.`Error Handling`: If any condition fails, the function stops execution, consuming all remaining gas. This indicates a serious contract error.

## revert_method
1.`Parameters`: Takes an unsigned integer, value.

2.`Description`: Uses revert to ensure value is within the range of 100 to 999.

3.`Error Handling`: If value is outside the range, the function stops execution and reverts state changes. An optional error message is provided.


## How to Use
1.Compile and deploy the contract to your chosen Remix IDE.

2.Test each function with different inputs to see how they handle errors and validate conditions.

3.Explore the output and error messages to understand how each function manages different situations.

4.By using the require, assert, and revert statements, you can enhance the reliability and security of your Solidity contracts. Experiment with the provided functions to see these error handling methods in action.

## Authors

Palguni N
palguni729@gmail.com

## License

This smart contract is licensed under the MIT License.
