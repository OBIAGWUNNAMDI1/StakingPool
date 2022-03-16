//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721{
        function balanceOf(address owner) external view returns (uint256 balance);
}
     
contract checker{
    address BoredApe = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d";     
     function checkBoredape(address _eoa) external view returns(bool){
         if(IERC721(BoredApe).balanceof(_eoa) > 0);
         returns true;
     }


}