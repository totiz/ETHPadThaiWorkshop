// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Token is ERC20, Ownable {
    constructor(address initialOwner, string memory name, string memory symbol)
        ERC20(name, symbol)
        Ownable(initialOwner)
    {}

    function mint(address to, uint256 amount)
        public
        // onlyOwner
    {
        _mint(to, amount);
    }
}

contract SimpleDex {
    ERC20Token public tokenA = new ERC20Token(msg.sender, "AA Token", "AA");
    ERC20Token public tokenB = new ERC20Token(msg.sender, "BB Token", "BB");

    constructor() {
        // Initial minting to the user
        tokenA.mint(msg.sender, 1000000 ether);
        tokenB.mint(msg.sender, 900000 ether);

        // Initial minting to this Dex
        tokenA.mint(address(this), 500000 ether);
        tokenB.mint(address(this), 300000 ether);
    }
}
