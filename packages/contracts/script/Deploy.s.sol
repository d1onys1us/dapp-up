// SPDX-License-Identifier: UNLICENSED
// credits: https://github.com/PaulRBerg/foundry-template/
pragma solidity >=0.8.19;

import {Diamonds} from "../src/Diamonds.sol";
import {Foo} from "../src/Foo.sol";

import {BaseScript} from "./Base.s.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    function run() public broadcaster returns (Diamonds diamonds) {
        diamonds = new Diamonds();
    }
}
