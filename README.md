# SmartContractSandbox 🔮
> My archive of small-scale smart contract projects and ideas.

## Overview
This repository serves as a personal playground and archive for experimenting with smart contract development. It contains various small-scale projects, proof-of-concepts, and implementation ideas using Solidity and other blockchain technologies.

## Project Structure
📁 SmartContractSandbox/
├── 📁 contracts/           # Smart contract source files
├── 📁 scripts/            # Deployment & testing scripts
├── 📁 test/              # Test files
└── 📁 examples/          # Example usage and demonstrations


## Featured Projects

### 🧮 Basic Calculator
A simple calculator contract demonstrating fundamental Solidity operations:
- Addition, subtraction, multiplication, division
- State management
- Basic error handling

### 💰 Token Contracts
Various token implementation examples:
- ERC20 tokens
- ERC721 (NFT) tokens
- Custom token mechanics

### 🔄 DeFi Components
Small DeFi building blocks:
- Simple swaps
- Liquidity pools
- Yield farming mechanics

## Technologies Used
- Solidity ^0.8.0
- Hardhat
- OpenZeppelin
- Ethers.js
- Waffle/Chai for testing

## Getting Started

### Prerequisites
- Node.js >= 14.0.0
- npm >= 6.0.0

### Installation
```bash
# Clone the repository
git clone https://github.com/GifftyCode/SmartContractSandbox.git

# Install dependencies
cd SmartContractSandbox
npm install

# Run all tests
npx hardhat test

# Run specific test file
npx hardhat test test/Calculator.test.js

# Deploy to local hardhat network
npx hardhat run scripts/deploy.js

# Deploy to testnet
npx hardhat run scripts/deploy.js --network goerli



Security
These contracts are experimental and not audited. They are meant for learning and demonstration purposes only. Do not use in production without proper security review.
Contributing
Feel free to fork this repository and submit pull requests. Ideas and improvements are always welcome!

Fork the project
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request

License
This project is licensed under the MIT License - see the LICENSE.md file for details.
Contact
Your Name - @GifftyCode
Project Link: https://github.com/GifftyCode/SmartContractSandbox
Acknowledgments

OpenZeppelin for secure contract templates
Hardhat documentation and examples
Ethereum community resources


⚠️ Disclaimer: These smart contracts are experimental and provided "as is" without warranty of any kind. Use at your own risk.