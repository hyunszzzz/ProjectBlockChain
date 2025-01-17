# CrossChain Swap Smart Contract

## Project Overview
This project implements a **cross-chain asset swap** feature on the Ethereum network using the **Anyswap protocol**. Users can automatically swap assets to another blockchain network based on a predefined **gas price threshold**.

The smart contract is designed to optimize costs by swapping the desired assets to another chain when gas prices are high, enabling users to save on transaction fees.



## Key Features
- **Gas Price Threshold Setting**: The smart contract executes an asset swap when the **transaction gas price** exceeds the defined **threshold (gasThreshold)**. (`function checkGasAndSwap`)
- **Cross-Chain Asset Swap**: Assets are swapped to another blockchain using the Anyswap protocol. (`function anySwapOut`)
- **Owner Privileges**: The contract owner can update the gas price threshold. (`function updateGasThreshold`)


## Tech Stack
- Solidity: v0.8.0  
- Truffle: v5.4.X  
- Ganache: Local blockchain development environment  
- Anyswap Protocol: Cross-chain protocol for asset swaps  
- Node.js: v14.X  

### Setup and Execution

1. Clone the Repository and Install Dependencies

First, clone the repository and install the required Node.js dependencies.


```
git clone https://github.com/your-repo/cross-chain-swap.git
cd cross-chain-swap
npm install
```

2. Run Ganache 

Run the local blockchain development environment using Ganache. By default, the RPC server will run at 127.0.0.1:8545.

```
ganache-cli --networkId 1337
```


3. Deploy the Smart Contract with Truffle

With Ganache running, deploy the smart contract to the local blockchain network using Truffle.

```
truffle migrate --network development
```




### Smart Contract Details

1. CrossSwapContrat.sol

이 스마트 계약은 다음과 같은 핵심 기능을 제공합니다:

- Gas Price Check and Asset Swap: When gas prices exceed the threshold, the contract swaps assets using the Anyswap protocol.
- Owner-Only Functions: Only the contract owner can update the gas price threshold.
- Event Trigger: Emits a GasPriceHigh event when the gas price exceeds the threshold, logging the transaction.

2. Deployment Script: 2_deploy_contracts.js

This script sets the Anyswap address and gas price threshold before deploying the smart contract. It connects the contract to the Anyswap protocol to enable cross-chain asset swaps.
