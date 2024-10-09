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


    event TargetMet(uint256 totalContribution);
    event TransferSuccessful(address contributor, uint amount);
    event FundingCompleted(uint deadline);

    modifier onlyOwner{
        require(msg.sender == owner, 'You are not the owner');
        _;
    }

    constructor(uint _target, uint _deadline) {
        msg.sender == owner;
        target == _target * 1 ether;
        deadline ==  block.timestamp + _deadline * 1 minutes;
        isTargetMet == false;
        isFundingCompleted == false;
    }


        function contribute() public payable {
        require(block.timestamp < deadline, 'Funding period not active yet');
        require(isTargetMet, 'Target has been reached yet');
        require(isFundingCompleted, 'Funding is not completed yet');

        uint contribution = msg.value;
        individualContribution[msg.sender] += contribution;
        totalContribution += contribution;

        if(totalContribution >= target) {
            isTargetMet = true;
            emit TargetMet(totalContribution);
        }

        emit  TransferSuccessful(contributor, contribution);


    }

        function withdraw() external onlyOwner payable {
            require(isTargetMet, 'Target is not yet Met');
            require(isFundingCompleted, 'Funding deadline not reached yet');

            isFundingCompleted = true;
            payable(owner).transfer(address(this).balance);

        }

            function getRefund() public payable  {
            require(block.timestamp >= deadline, 'Funding has not ended yet');
            require(!isTargetMet, 'Target has been met already');
            require(individualContribution[msg.sender] > 0, 'No contribution to refund');

            uint contribution = individualContribution[msg.sender];
            individualContribution[msg.sender] = 0;
            totalContribution -= contribution;

            payable(msg.sender).transfer(contribution);

            emit TransferSuccessful(msg.sender, contribution);


        }

}

