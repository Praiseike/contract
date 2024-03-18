// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership");
        owner = newOwner;
    }

    function mint(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        _mint(owner, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function decimals() public view returns (uint8) {
        return 18; // Assuming 18 decimals for this example
    }

    function symbol() public view returns (string memory) {
        return "MTK";
    }
}
