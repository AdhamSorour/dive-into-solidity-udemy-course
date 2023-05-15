//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() public {
        tokens[0] = "VET";
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function transferAll(address to) external {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool s, ) = to.call{ value: getBalance() }("");
        require(s);
    }

    function start() external {
        players.push(msg.sender);
    }

    function concatenate(string calldata s1, string calldata s2) external pure returns(string memory s) {
        s = string.concat(s1, s2);
    }

    receive() external payable { }
}
