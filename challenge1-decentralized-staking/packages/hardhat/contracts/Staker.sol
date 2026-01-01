// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
    }

    mapping ( address => uint256 ) public balances;
    uint256 public constant threshold = 1 ether;
    uint256 public deadline = block.timestamp + 72 hours;
    bool public openForWithdraw = false;

    event Stake(address indexed, uint256);

    modifier notCompleted() {
        require(!exampleExternalContract.completed(), "Staking process already completed");
        _;
    }

    function stake() public payable notCompleted {
        require(block.timestamp < deadline, "Out of time to send money to fund!");
         // Update the sender's balance
         balances[msg.sender] += msg.value;
    
         // Emit the Stake event
         emit Stake(msg.sender, msg.value);
     }
    
    function execute() public notCompleted {
        require(block.timestamp >= deadline, "Deadline has not been reached yet");
    
        if (address(this).balance >= threshold) {
            // Đạt 1 ETH → Gửi hết tiền sang ExternalContract
            exampleExternalContract.complete{value: address(this).balance}();
        } else {
            // Không đạt 1 ETH → Cho phép người dùng rút tiền
            openForWithdraw = true;
        }
    }

    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return deadline - block.timestamp;
    }

    function withdraw() public notCompleted {
        require(openForWithdraw, "Withdrawals not allowed yet");
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance to withdraw");
        balances[msg.sender] = 0;
        
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }

    receive() external payable {
        stake();
    }
}
