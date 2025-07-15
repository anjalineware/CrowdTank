const hre = require("hardhat");

async function main() {
  const CrowdTank = await hre.ethers.getContractFactory("CrowdTank");
  const crowdTank = await CrowdTank.deploy();
  await crowdTank.waitForDeployment();

  // For ethers v6, use .target; for ethers v5, use .address
  console.log("CrowdTank deployed to:", crowdTank.target || crowdTank.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});