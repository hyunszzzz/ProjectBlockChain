
const CrossSwapContrat = artifacts.require("CrossSwapContrat");

module.exports = function (deployer) {
  // Anyswap smart contract address
  const anyswapAddress = "0xF68C9Df95a18B2A5a5fa1124d79EEEffBaD0B6Fa";  
  // Gas price threshold in Gwei
  const gasThreshold = web3.utils.toWei("50", "gwei");

  // Deploy the CrossSwapContrat smart contract with parameters
  deployer.deploy(CrossSwapContrat, anyswapAddress, gasThreshold);
};