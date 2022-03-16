import { ethers } from "hardhat";

async function main() {
    const token = await ethers.getContractFactory("TOken");
    const boredApeCheck = await ethers.getContractAt("IER721","0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d")
    const Tokens = await token.deploy(1000000);
    await Tokens.deployed()