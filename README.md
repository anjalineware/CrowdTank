
# 📦 CrowdTank – A Decentralized Crowdfunding Smart Contract

CrowdTank is a Solidity-based smart contract that enables decentralized project fundraising. It allows project creators to raise funds transparently, while contributors can support projects and withdraw their contributions if funding goals are not met.

---

## 🚀 Features

- ✅ Project creation with title, description, funding goal, and deadline  
- ✅ Funding from multiple users via ETH  
- ✅ Automatic tracking of total amount raised  
- ✅ Contributors can withdraw if funding goal is not reached in time  
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
git clone https://github.com/your-username/crowdtank.git
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
npx hardhat verify --network sepolia <DEPLOYED_CONTRACT_ADDRESS>
```

---

## ✅ Example Usage

```solidity
crowdTank.createProject("Save Earth", "Eco awareness campaign", 10 ether);
crowdTank.fundProject(0, { value: 2 ether });
uint remaining = crowdTank.getRemainingFunding(0);
address topFunder = crowdTank.getHighestFunder(0);
```

---

## 📁 Project Structure

```
crowdtank/
│
├── contracts/
│   └── CrowdTank.sol         # Main smart contract
│
├── scripts/
│   └── deploy-crowdToken.js  # Deployment script
│
├── test/                     # Add unit tests here
├── hardhat.config.js         # Hardhat setup
└── README.md                 # Project documentation
```

---

## 📷 Screenshots / Demo

> *(Add a screenshot of your verified Etherscan contract or Remix output)*

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change or improve.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 👩‍💻 Author

**Anjali Neware** – [LinkedIn](https://linkedin.com/in/your-profile) • [Twitter](https://twitter.com/your-handle)
