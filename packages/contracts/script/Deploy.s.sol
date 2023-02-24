// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.18;

import {Script} from "forge-std/Script.sol";
import {Foo} from "../src/Foo.sol";

contract Deploy is Script {
    address internal deployer;
    /// List all contracts you want to deploy
    Foo internal foo;

    function setUp() public virtual {
        (deployer,) = deriveRememberKey(vm.envString("MNEMONIC"), 0);
    }

    function run() public {
        vm.startBroadcast(deployer);
        // deploy foo
        foo = new Foo();
        vm.stopBroadcast();
    }
}
