// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;   // Version of solidity that will compile this program

contract BlockHelloWorld {  
    uint256 EthereumIown = 0;     // Variable to store the ethereum I own

    function setValue(uint256 x) public {
        EthereumIown =x;         // Function to set the value for EthereumIown variable. 
    }

    function getValue() public view returns (uint256)
    {
        return EthereumIown;     // Function to get the value of the variable EthereumIown. 
    }

}
