// SPDX-License-Identifier: MIT

// specifies what version of compiler this code will be compiled with
pragma solidity ^0.8.0;

contract Voting {
    /* the mapping field below is equivalent to an associative array or hash.
    */

    mapping (string => uint256) votesReceived;

    string[] public candidateList;

    /* Broadcast event when a user voted
    */
    event VoteReceived(address user, string candidate);

    /* This is the constructor which will be called once and only once - when you
    deploy the contract to the blockchain. When we deploy the contract,
    we will pass an array of candidates who will be contesting in the election
    */
    constructor(string[] memory candidateNames) {

    }

    // This function returns the total votes a candidate has received so far
    function totalVotesFor(string memory candidate) public view returns (uint256) {

    }

    // This function increments the vote count for the specified candidate. This
    // is equivalent to casting a vote
    function voteForCandidate(string memory candidate) public {
    }

    // Number of candidates
    function candidateCount() public view returns (uint256) {

    }
}
