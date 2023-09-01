// SPDX-License-Identifier: MIT
// credits: https://github.com/PaulRBerg/foundry-template/
pragma solidity >=0.8.19;

import {Script} from "forge-std/Script.sol";

abstract contract BaseScript is Script {
    /// @dev Included to enable compilation of the script without a $MNEMONIC environment variable.
    string internal constant TEST_MNEMONIC =
        "test test test test test test test test test test test junk";

    /// @dev Needed for the deterministic deployments.
    bytes32 internal constant ZERO_SALT = bytes32(0);

    /// @dev The address of the contract deployer.
    address internal deployer;

    /// @dev Used to derive the deployer's address.
    uint256 internal key;

    constructor() {
        key = vm.envUint("PRIVATE_KEY");
        deployer = vm.rememberKey(key);
    }

    modifier broadcaster() {
        vm.startBroadcast(deployer);
        _;
        vm.stopBroadcast();
    }
}
