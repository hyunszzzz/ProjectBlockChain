
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for interacting with Anyswap protocol
interface IAnySwap {
    function anySwapOut(address asset, address to, uint value, uint toChainID) external;
}

contract CrossSwapContrat {
    address public owner;  // Contract owner
    uint256 public gasThreshold; // Gas price threshold
    IAnySwap public anyswap; // Anyswap contract interface

    // Event emitted when gas price exceeds threshold and swap is triggered
    event GasPriceHigh(uint256 gasPrice, string action);

    // Constructor to initialize contract with Anyswap address and gas threshold
    constructor(address _anyswap, uint256 _gasThreshold) {
        owner = msg.sender;
        gasThreshold = _gasThreshold;
        anyswap = IAnySwap(_anyswap); // Linking to the Anyswap contract
    }

    // Function to check gas price and trigger cross-chain asset swap
    function checkGasAndSwap(address asset, address to, uint256 value, uint256 toChainID) public {
        uint256 currentGasPrice = tx.gasprice;
        require(currentGasPrice > gasThreshold, "Gas price too low");
        
        emit GasPriceHigh(currentGasPrice, "Swapping Assets");
        anyswap.anySwapOut(asset, to, value, toChainID); // Triggering asset swap via Anyswap
    }

    // Function to update the gas price threshold (owner only)
    function updateGasThreshold(uint256 _gasThreshold) public {
        require(msg.sender == owner, "Only owner can update");
        gasThreshold = _gasThreshold;
    }
}