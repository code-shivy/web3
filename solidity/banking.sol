// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract bank {

  // Struct to define Account details
  struct Account {
    address owner;
    uint256 balance;
    uint256 accountCreatedTime;
  }

  // Mapping to store Account data for each address
  mapping(address => Account) public BankName;

  // Events for balance changes
  event balanceAdded(address owner, uint256 balance, uint256 timestamp);
  event withdrawlDone(address owner, uint256 balance, uint256 timestamp);

  // Modifier to enforce minimum deposit amount (1 ether)
  modifier minimum() {
    require(msg.value >= 1 ether, "Doesn't follow minimum croteria.");
    _; 
  }

  // Function for account creation (triggered when funds are sent to the contract)
  function accountCreated() public payable minimum {
    BankName[msg.sender].owner = msg.sender;
    BankName[msg.sender].balance = msg.value;
    BankName[msg.sender].accountCreatedTime = block.timestamp;
    emit balanceAdded(msg.sender, msg.value, block.timestamp);
  }

  // Function for depositing funds
  function deposit() public payable minimum {
    BankName[msg.sender].balance += msg.value;
    emit balanceAdded(msg.sender, msg.value, block.timestamp);
  }

  // Function for withdrawing funds
  function withdrawl() public payable {
    payable(msg.sender).transfer(BankName[msg.sender].balance);
    BankName[msg.sender].balance = 0; // Clear the balance after withdrawal
    emit withdrawlDone(msg.sender, BankName[msg.sender].balance, block.timestamp);
  }
}
