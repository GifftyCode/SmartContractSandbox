
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract CrowdFunding {
    address owner;
    uint256 public target;
    uint256  public totalContribution;
    mapping (address => uint) public individualContribution;
    uint256 public deadline;
    bool public  isTargetMet;
    bool public isFundingCompleted;
   


    event TargetMet(uint256 totalContribution);
    event TransferSuccessful(address contributor, uint amount);
    event FundingCompleted(uint totalContribution);

    constructor(uint256 _target, uint256 _deadline) {
        owner = msg.sender;
        target = _target * 1 ether;
        deadline =  block.timestamp + _deadline * 1 minutes;
        isTargetMet = false;
        isFundingCompleted = false;
    }


    modifier onlyOwner{
        require(msg.sender == owner, 'You are not the owner');
        _;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, 'Funding period not active yet');
        require(!isTargetMet, 'Target has ended');
        require(!isFundingCompleted, 'Funding is already completed');

        uint256 contribution = msg.value;
        individualContribution[msg.sender] += contribution;
        totalContribution += contribution;

        if(totalContribution >= target) {
            isTargetMet = true;
            emit TargetMet(totalContribution);
        }

        emit  TransferSuccessful(msg.sender, contribution);
    }

    function withdrawFunds() public onlyOwner  {
        require(isTargetMet, 'Target is not yet Met');
        require(!isFundingCompleted, 'Funding is already');

        isFundingCompleted = true;
        payable(owner).transfer(address(this).balance);

    }

    function getRefund() public   {
        require(block.timestamp >= deadline, 'Funding period has not ended yet');
        require(!isTargetMet, 'Target has been met already');
        require(individualContribution[msg.sender] > 0, 'No contribution to refund');

        uint256 contribution = individualContribution[msg.sender];
        individualContribution[msg.sender] = 0;
        totalContribution -= contribution;

        payable(msg.sender).transfer(contribution);

        emit TransferSuccessful(msg.sender, contribution);


    }

    function getCurrentBalance() public view returns(uint) {
        return address(this).balance;
    }

    function extendDeadline(uint _deadline) public onlyOwner {
        deadline += _deadline * 1;
    }

}
