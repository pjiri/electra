// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Poll {
        string question;
        string[] options;
        mapping(uint => uint) votes;
        mapping(address => bool) hasVoted;
        bool active;
    }

    mapping(uint => Poll) public polls;
    uint public pollCount;

    function createPoll(string memory _question, string[] memory _options) public {
        Poll storage newPoll = polls[pollCount++];
        newPoll.question = _question;
        newPoll.options = _options;
        newPoll.active = true;
    }

    function vote(uint _pollId, uint _optionId) public {
        Poll storage poll = polls[_pollId];
        require(poll.active, "Poll is not active");
        require(!poll.hasVoted[msg.sender], "Already voted");
        require(_optionId < poll.options.length, "Invalid option");

        poll.votes[_optionId]++;
        poll.hasVoted[msg.sender] = true;
    }

    function endPoll(uint _pollId) public {
        polls[_pollId].active = false;
    }
}
