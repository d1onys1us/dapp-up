// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

contract Foo {
    string public myString = "Hello, world!";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
