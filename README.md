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

import "./media-protocol/contracts/interfaces/IMarketplaceStorage.sol";

contract SimpleInitializeMarketplace {
    IMarketplaceStorage marketplaceStorage;
    constructor(address _marketplaceAddress) {
        marketplaceStorage = IMarketplaceStorage(_marketplaceStorageAddress);
    }

    function initializeMarketplace() external returns (uint marketplaceId) {
        marketplaceId = marketplaceStorage.initializeMarketplace(
            5000000000000000000, 
            msg.sender, 
            30000 // 3% fee
        );
    }
}
```

Use your preferred tools to compile and test your contracts that interact with these interfaces.

### Contract Addresses

⚠️ **Important Notice**: The contract addresses listed are currently from testnets and may be subject to change. Always refer to the [official Media Protocol documentation](https://www.mediaprotocol.net/smart-contracts/deployment-addresses) for the most up-to-date and valid contract addresses before any interactions.


### Future Updates
The full implementation of the smart contracts will be published in this repository once the audit is complete. Stay tuned for updates.

### Contributions
We welcome feedback and suggestions. Please feel free to open issues or pull requests for discussions.
