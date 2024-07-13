// SPDX-License-Identifier: MIT
// Author: Nattapon Nimakul

pragma solidity ^0.8.0;

import {IYourSolver, ThePuzzle} from "./puzzle/ThePuzzle.sol";

contract AYourSolver {
    ThePuzzle private puzzle;

    constructor() {
        puzzle = new ThePuzzle();
    }

    function solver1() public view returns (string memory) {
        return puzzle.execMin();
    }

    function solver2() public view returns (string memory) {
        return puzzle.execMinArray();
    }

    function solver3() public view returns (string memory) {
        return puzzle.execAvg();
    }

    function solver4() public view returns (string memory) {
        return puzzle.execAvgArray();
    }

    // Put your solutions here !!!!
}
