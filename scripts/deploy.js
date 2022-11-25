// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  

  const Contract = await hre.ethers.getContractFactory("AllInOneSolution");
  const contract = await Contract.deploy('0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5');
  await contract.deployed();
  
  console.log(
    `Contract deployed to ${contract.address}`
  );

  await contract.triggerExo10();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
