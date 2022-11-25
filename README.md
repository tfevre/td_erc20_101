# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
const Contract = await hre.ethers.getContractFactory("AllInOneSolution");

const contract = await Contract.attach('0x7598815926544669A1cb9f356956E4E73EF11916');

await contract.triggerExo10()