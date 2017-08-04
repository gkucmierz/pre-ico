
var ThreesigWallet = artifacts.require("./threesig-wallet.sol");
var PreIco = artifacts.require("./pre-ico.sol");

module.exports = function(deployer) {
  deployer.deploy(ThreesigWallet);
  deployer.deploy(PreIco);
};
