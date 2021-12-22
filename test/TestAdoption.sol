pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  // The id of the pet that will be used for testing
  uint256 expectedPetId = 8;
  // The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

  function testUserCanAdoptPet() public {
    uint256 returnId = adoption.adopt(expectedPetId);

    Assert.equal(
      returnId,
      expectedPetId,
      "Return value of Adoption should match value passed into Adopt Function."
    );
  }

  function testGetAdopterAddressByPetId() public {
    address adoptor = adoption.adopters(expectedPetId);

    Assert.equal(
      adoptor,
      expectedAdopter,
      "Owner of the expected pet should be this contract"
    );
  }

  function testGetAdopterAddressByPetIdInArray() public {
    address[16] memory adoptors = adoption.getAdopters();

    Assert.equal(
      adoptors[expectedPetId],
      expectedAdopter,
      "Owner of the expected pet should be this contract"
    );
  }
}
