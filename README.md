
# 📦 CrowdTank – A Decentralized Crowdfunding Smart Contract

CrowdTank is a Solidity-based smart contract that enables decentralized project fundraising. It allows project creators to raise funds transparently, while contributors can support projects and withdraw their contributions if funding goals are not met.

---

## 🚀 Features

- ✅ Project creation with title, description, funding goal, and deadline  
- ✅ Funding from multiple users via ETH  
- ✅ Automatic tracking of total amount raised  
- ✅ Contributors can withdraw if the funding goal is not reached in time  
- ✅ Project creators can withdraw when the funding goal is met  
- ✅ Tracks the **highest funder** per project  
- ✅ Calculates **remaining funding needed**  
- ✅ Verified on **Sepolia Testnet**

---

## 🧱 Smart Contract Overview

### Main Functions:
- `createProject(title, description, goal)` – Create a new project  
- `fundProject(projectId)` – Contribute ETH to a project  
- `updateFundingGoal(projectId, newGoal)` – Creator can change goal  
- `getRemainingFunding(projectId)` – View how much funding is still needed  
- `getHighestFunder(projectId)` – View who contributed the most  

---

## 🛠 Tech Stack

- **Solidity** – Smart Contract Language  
- **Hardhat** – Development Environment & Test Runner  
- **Ethers.js** – Web3 Interaction  
- **MetaMask** – Wallet Integration  
- **Sepolia Testnet** – Deployment  
- **Remix IDE** – Rapid Testing & Debugging

---

## ⚙️ Installation & Setup

```bash
git clone https://github.com/anjalineware/CrowdTank.git
cd crowdtank
npm install
```

## 🔧 Compile Contracts

```bash
npx hardhat compile
```

## 🚀 Deploy to Sepolia

Update `hardhat.config.js` with your:
- Sepolia RPC URL (e.g., from Infura/Alchemy)
- Wallet Private Key
- Etherscan API Key

Then run:

```bash
npx hardhat run scripts/deploy-crowdToken.js --network sepolia
```

---

## 🔍 Verify Contract on Etherscan

```bash
npx hardhat verify <DEPLOYED_CONTRACT_ADDRESS> --network sepolia 
```

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change or improve.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

