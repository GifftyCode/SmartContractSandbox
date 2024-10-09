// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract CrowdFunding {
    address owner;
    uint256 amountContributed;
    uint256 public target;
    uint256  public totalContribution;
    mapping (address => uint) public individualContribution;
    uint public deadline;
    bool isTargetMet;
    bool isFundingCompleted;
    address public contributor;

}