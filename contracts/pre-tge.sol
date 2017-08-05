pragma solidity ^0.4.4;

contract preTgeExperty {

  struct Contributor {
    address addr;
    uint256 amount;
  }
  
  Contributor[] public contributors;

  uint8 public basicRate;
  uint8 public preIcoBonus;
  address public multisigAddr;
  
  // preICO constructor
  function preTgeExperty(uint8 br, uint8 pib, address ma) {
    basicRate = br;
    preIcoBonus = pib;
    multisigAddr = ma;
  }

  // contribute function
  function() payable {
    uint256 ethers = msg.value;
    // calculate tokens amount and pre-ico bonus
    uint256 tokens = ethers * basicRate;
    uint256 bonus = ethers * preIcoBonus;

    // save contributor for further use
    contributors.push(Contributor({
      addr: msg.sender,
      amount: tokens + bonus
    }));

    // send ethers to secure wallet
    multisigAddr.transfer(ethers);
  }
  
}
