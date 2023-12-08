# Media Protocol Smart Contracts

Welcome to the Media Protocol Smart Contracts repository. This space is dedicated to our upcoming smart contracts, which are currently under thorough audit to ensure top-notch security and efficiency.

In the meantime, we've provided the interfaces of these contracts for developers. This allows you to begin testing and familiarizing yourself with the Media Protocol's capabilities in preparation for the full release.

## Using the Interfaces

Clone the repository:

```bash
git clone https://github.com/mediafoundation/media-protocol.git
```

### Integration and Testing
The interfaces can be imported into your Solidity projects to interact with the Media Protocol. For example:
```solidity
pragma solidity ^0.8.17;

import "./media-protocol/contracts/interfaces/IMarketplace.sol";

contract SimpleInitializeMarketplace {
    Marketplace marketplace;
    constructor(address _marketplaceAddress) {
        marketplace = Marketplace(_marketplaceAddress);
    }

    function initializeMarketplace() external returns (uint marketplaceId) {
        marketplaceId = marketplace.initializeMarketplace(
            5000000000000000000, 
            msg.sender, 
            3
        );
    }
}
```

Use your preferred tools to compile and test your contracts that interact with these interfaces.

### Contract Addresses
As we are still in the process of deploying the contracts, their addresses are not yet available.

A set of testnet addresses, including those for Goerli, Base Goerli, and LaTesnet, will be published here soon. We encourage you to watch this repository for updates.

### Future Updates
The full implementation of the smart contracts will be published in this repository once the audit is complete. Stay tuned for updates.

### Contributions
We welcome feedback and suggestions. Please feel free to open issues or pull requests for discussions.
