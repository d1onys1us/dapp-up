// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.18;

contract Foo {
    string public myString = "Hello World!";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
