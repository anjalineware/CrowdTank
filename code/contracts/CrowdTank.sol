// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdTank {
    // struct to store project details
    struct Project {
        address creator;
        string name;
        string description;
        uint fundingGoal;
        uint deadline;
        uint amountRaised;
        bool funded;
        address highestFunder; // can be used to track the highest funder
    }
    // projectId => project details
    mapping(uint => Project) public projects;
    // projectId => user => contribution amount/funding amount 
    mapping(uint => mapping(address => uint)) public contributions;
    // projectId => list of contributor addresses
    mapping(uint => address[]) public projectContributors;

    // projectId => whether the id is used or not
    mapping(uint => bool) public isIdUsed;


    // events
    event ProjectCreated(uint indexed projectId, address indexed creator, string name, string description, uint fundingGoal, uint deadline);
    event ProjectFunded(uint indexed projectId, address indexed contributor, uint amount);
    event FundsWithdrawn(uint indexed projectId, address indexed withdrawer, uint amount, string withdrawerType);
    // withdrawerType = "user" ,= "admin"
    event ProjectUpdated(uint indexed projectId, uint newFundingGoal);

    // create project by a creator
    // external public internal private
    function createProject(string memory _name, string memory _description, uint _fundingGoal, uint _durationSeconds, uint _id) external {
        require(!isIdUsed[_id], "Project Id is already used");
        isIdUsed[_id] = true;
        projects[_id] = Project({
        creator : msg.sender,
        name : _name,
        description : _description,
        fundingGoal : _fundingGoal,
        deadline : block.timestamp + _durationSeconds,
        amountRaised : 0,
        funded : false,
        highestFunder : address(0)
        });
        emit ProjectCreated(_id, msg.sender, _name, _description, _fundingGoal, block.timestamp + _durationSeconds);
    }

    function fundProject(uint _projectId) external payable {
        Project storage project = projects[_projectId];
        require(block.timestamp <= project.deadline, "Project deadline is already passed");
        require(!project.funded, "Project is already funded");
        require(msg.value > 0, "Must send some value of ether");
        project.amountRaised += msg.value;
        // If this is the first contribution from this address, add to contributors list
        if (contributions[_projectId][msg.sender] == 0) {
            projectContributors[_projectId].push(msg.sender);
        }
        contributions[_projectId][msg.sender] += msg.value;
        emit ProjectFunded(_projectId, msg.sender, msg.value);
        if (project.amountRaised >= project.fundingGoal) {
            project.funded = true;
        }
    }

    //task 1: Returns the remaining funding needed for a project, or 0 if fully funded.
    function getRemainingFunding(uint projectId) public view returns (uint) {
        require(isIdUsed[projectId], "Invalid projectId");

        Project storage project = projects[projectId];
        
        if (project.amountRaised >= project.fundingGoal) {
            return 0;
        }

        return project.fundingGoal - project.amountRaised;
    }

    //task 2: Change funding goal of a project
    function updateFundingGoal(uint projectId, uint newFundingGoal) public 
    {
        require(isIdUsed[projectId], "Invalid projectId");
        Project storage project = projects[projectId];
        require(msg.sender == project.creator, "Only project creator can update funding goal");
        require(newFundingGoal > 0, "Funding goal must be greater than zero");
        project.fundingGoal = newFundingGoal;
        emit ProjectUpdated(projectId, newFundingGoal);
    }

    //task 3 highest funder of each project
    function getHighestFunder(uint projectId) public view returns (address, uint) {
        require(isIdUsed[projectId], "Invalid projectId");
        address highestFunder;
        uint highestAmount = 0;

        address[] memory contributors = projectContributors[projectId];
        for (uint i = 0; i < contributors.length; i++) {
            address contributor = contributors[i];
            uint contribution = contributions[projectId][contributor];
            if (contribution > highestAmount) {
                highestAmount = contribution;
                highestFunder = contributor;
            }
        }
        return (highestFunder, highestAmount);
    }


    function userWithdrawFunds(uint _projectId) external payable {
        Project storage project = projects[_projectId];
        require(project.amountRaised < project.fundingGoal, "Funding goal is reached, user cant withdraw");
        uint fundContributed = contributions[_projectId][msg.sender];
        payable(msg.sender).transfer(fundContributed);
    }

    function adminWithdrawFunds(uint _projectId) external payable {
        Project storage project = projects[_projectId];
        uint totalFunding = project.amountRaised;
        require(project.funded, "Funding is not sufficient");
        require(project.creator == msg.sender, "Only project admin can withdraw");
        require(project.deadline <= block.timestamp, "Deadline for project is not reached");
        payable(msg.sender).transfer(totalFunding);
    }

    // this is example of a read-only function
    function isIdUsedCall(uint _id)external view returns(bool){
        return isIdUsed[_id];
    }


    
}