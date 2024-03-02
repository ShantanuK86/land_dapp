const hre = require("hardhat");

async function main() {
  // Deploy the Land contract
  const Land = await hre.ethers.getContractFactory("Land");
  const land = await Land.deploy();
  await land.deployed();

  // Print the deployed contract address
  console.log("Land contract deployed to:", land.address);
}

// Run the deployment script
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
