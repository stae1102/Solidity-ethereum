//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract StartStopUpdateExample {
  address owner;

  bool public paused;

  constructor() {
    owner = msg.sender;
  }

  function sendMoney() public payable {

  }

  function setPaused(bool _paused) public {
    require(msg.sender == owner, "You are not the owner");
    paused = _paused;
  }

  function withdrawAllMoney(address payable _to) public {
    require(msg.sender == owner, "You are not the owner");
    require(!paused, "Contract is paused");
    _to.transfer(address(this).balance);
  }

  function destroySmartContract(address payable _to) public payable {
    require(msg.sender == owner, "You are not owner");
    selfdestruct(_to);
  }
}
