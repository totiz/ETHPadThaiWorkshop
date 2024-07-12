// SPDX-License-Identifier: MIT
// Author: Nattapon Nimakul

pragma solidity ^0.8.0;

interface IYourSolver {
    function min(uint256 a_, uint256 b_) external pure returns (uint256);
    function minArray(uint256[] memory numbers_) external pure returns (uint256);
    function avg(uint256 a_, uint256 b_) external pure returns (uint256);
    function avgArray(uint256[] memory numbers_) external pure returns (uint256);
}

contract ThePuzzle {
    // error UnableToCallYourMethod(string name);
    
    function execMin() public view returns (string memory) {
        IYourSolver solver = IYourSolver(msg.sender);

        // test calling
        try solver.min(1, 2) returns (uint256) {

        } catch {
            return "Unable to call your method: min(uint256, uint256) returns (uint256)";
        }

        if (solver.min(7, 13) != 7) {
            return "Incorrect answer!! min(7, 13)";
        }
        if (solver.min(483299, 195823830) != 483299) {
            return "Incorrect answer!! min(483299, 195823830)";
        }
        if (solver.min(55555, 666) != 666) {
            return "Incorrect answer!! min(55555, 666)";
        }
        if (solver.min(8787878778, 12121212) != 12121212) {
            return "Incorrect answer!! min(8787878778, 12121212)";
        }
        if (solver.min(3333, 7777) != 3333) {
            return "Incorrect answer!! min(3333, 7777)";
        }

        return "Great job on completing Problem 1!!! You've made a fantastic start.";
    }

    function execMinArray() public view returns (string memory) {
        IYourSolver solver = IYourSolver(msg.sender);

        uint256[] memory input = new uint256[](3);
        // test calling
        try solver.minArray(input) returns (uint256) {

        } catch {
            return "Unable to call your method: minArray(uint256[]) returns (uint256)";
        }

        input[0] = 20;
        input[1] = 11;
        input[2] = 800;
        if (solver.minArray(input) != 11) {
            return "Incorrect answer!! minArray([20, 11, 800])";
        }

        input[0] = 8787878778;
        input[1] = 195823830;
        input[2] = 55555;
        if (solver.minArray(input) != 55555) {
            return "Incorrect answer!! minArray([8787878778, 195823830, 55555])";
        }

        input = new uint256[](5);
        input[0] = 949349;
        input[1] = 545;
        input[2] = 88999;
        input[3] = 11;
        input[4] = 34434;
        if (solver.minArray(input) != 11) {
            return "Incorrect answer!! minArray([949349, 545, 88999, 11, 34434])";
        }

        return "Awesome job on Problem 2!  You're really making progress.";
    }

    function execAvg() public view returns (string memory) {
        IYourSolver solver = IYourSolver(msg.sender);

        // test calling
        try solver.avg(1, 2) returns (uint256) {

        } catch {
            return "Unable to call your method: avg(uint256, uint256) returns (uint256)";
        }

        if (solver.avg(7, 13) != 10) {
            return "Incorrect answer!! avg(7, 13)";
        }
        if (solver.avg(483299, 195823830) != 98153564) {
            return "Incorrect answer!! avg(483299, 195823830)";
        }
        if (solver.avg(55555, 666) != 28110) {
            return "Incorrect answer!! avg(55555, 666)";
        }
        if (solver.avg(8787878778, 12121212) != 4399999995) {
            return "Incorrect answer!! avg(8787878778, 12121212)";
        }
        if (solver.avg(3333, 7777) != 5555) {
            return "Incorrect answer!! avg(3333, 7777)";
        }

        return "Great work on completing Problem 3! You're making amazing progress.";
    }

    function execAvgArray() public view returns (string memory) {
        IYourSolver solver = IYourSolver(msg.sender);

        uint256[] memory input = new uint256[](3);
        input[0] = 777;
        input[1] = 333;
        input[2] = 888;

        // test calling
        try solver.avgArray(input) returns (uint256) {

        } catch {
            return "Unable to call your method: avgArray(uint256[]) returns (uint256)";
        }

        input[0] = 20;
        input[1] = 11;
        input[2] = 800;
        if (solver.avgArray(input) != 277) {
            return "Incorrect answer!! avgArray([20, 11, 800])";
        }

        input[0] = 8787878778;
        input[1] = 195823830;
        input[2] = 55555;
        if (solver.avgArray(input) != 2994586054) {
            return "Incorrect answer!! avgArray([8787878778, 195823830, 55555])";
        }

        input = new uint256[](5);
        input[0] = 949349;
        input[1] = 545;
        input[2] = 88999;
        input[3] = 11;
        input[4] = 34434;
        if (solver.avgArray(input) != 214667) {
            return "Incorrect answer!! avgArray([949349, 545, 88999, 11, 34434])";
        }

        return "Congratulations on finishing the final problem!!! You're doing great!";
    }
}


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

    function min(uint256 a_, uint256 b_) external pure returns (uint256) {
        return a_ < b_ ? a_ : b_;
    }

    function minArray(uint256[] memory numbers_) external pure returns (uint256) {
        uint256 curMin = type(uint256).max;

        for (uint256 i = 0; i < numbers_.length; i++) 
        {
            if (numbers_[i] < curMin) {
                curMin = numbers_[i];
            }
        }

        return curMin;
    }

    function avg(uint256 a_, uint256 b_) external pure returns (uint256) {
        return (a_ + b_) / 2;
    }

    function avgArray(uint256[] memory numbers_) external pure returns (uint256) {
        uint256 sum;

        for (uint256 i = 0; i < numbers_.length; i++) 
        {
            sum += numbers_[i];
        }

        return sum / numbers_.length;
    }
}
