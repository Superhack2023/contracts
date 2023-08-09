// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "openzeppelin-contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "openzeppelin-contracts/access/Ownable.sol";

contract FactoryProxy is ERC1967Proxy, Ownable {
  address public implementation;

  constructor(address _impl) ERC1967Proxy(_impl, "") {
    implementation = _impl;
  }

  function upgradeTo(address newImplementation) external onlyOwner {
    _upgradeTo(newImplementation);
  }
}
