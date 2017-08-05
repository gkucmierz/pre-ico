pragma solidity ^0.4.4;

contract ThreesigWallet {

  mapping (address => bool) public founders;

  struct Tx {
    address founder;
    address destAddr;
    bool active;
  }
  
  Tx[] public txs;
  
  // constructor made of 3 independent wallets
  function ThreesigWallet(address a, address b, address c) {
    founders[a] = true;
    founders[b] = true;
    founders[c] = true;
  }
  
  // preICO contract will send ETHers here
  function() {}
  
  // one of founders can propose destination address for ethers
  function proposeTx(address destAddr) isFounder {
    txs.push(Tx({
      founder: msg.sender,
      destAddr: destAddr,
      active: true
    }));
  }
  
  // another founder can approve specified tx and send it to destAddr
  function approveTx(uint8 txIdx) isFounder {
    assert(txs[txIdx].founder != msg.sender);
    assert(txs[txIdx].active);
    
    txs[txIdx].active = false;
    txs[txIdx].destAddr.transfer(this.balance);
  }
  
  // check if msg.sender is founder
  modifier isFounder() {
    require(founders[msg.sender]);
    _;
  }

}
