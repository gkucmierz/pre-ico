pragma solidity ^0.4.14;

import "threesig-wallet.sol";

contract preIco {

  struct Investor {
    address addr;
    uint256 amount;
  }
  
  Investor[] investors;

  uint8 basicRate;
  uint8 preIcoBonus;
  address multisigAddr;
  
  // preICO constructor
  function preIco(uint8 br, uint8 pib, address ma) {
    basicRate = br;
    preIcoBonus = pib;
    multisigAddr = ma;
  }

  // invest function
  function() payable {
    uint256 ethers = msg.value;
    // calculate tokens amount and pre-ico bonus
    uint256 tokens = ethers * basicRate;
    uint256 bonus = ethers * preIcoBonus;

    // save investor for further use
    investors.push(Investor({
      addr: msg.sender,
      amount: tokens + bonus
    }));

    // send ethers to secure wallet
    multisigAddr.transfer(ethers);
  }
  
}
