// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {SignalService} from "../src/SignalService.sol";

contract SignalServiceTest is Test {
    function testSignalService() public {
        SignalService ss = new SignalService();
        ss.isSignalReceived();
    }
}
