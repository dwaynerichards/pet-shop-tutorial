pragma solidity ^0.5.0;

contract Adoption {
  address[16] public adopters;
  mapping(address => uint256) ownerToPet;
  event Adopted(uint256 petId, address owner);

  //array of 16 adoptors addresses
  function adopt(uint256 petId) public returns (uint256) {
    require(petId > 0 && petId < 15);

    adopters[petId] = msg.sender;
    ownerToPet[msg.sender] = petId;
    emit Adopted(petId, msg.sender);

    return petId;
  }

  //@return adopters memory gives the data location for the variable.
  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }
}
