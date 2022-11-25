// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    address[] private whitelist;
    mapping(address => bool) tier1;
    mapping(address => bool) tier2;
    

    constructor(string memory _name, string memory _symbol, uint256 _supply) ERC20(_name, _symbol) {
        _mint(msg.sender, _supply);
    }

    function getAddress() public view returns (address){
        return address(this);
    }

    function getToken() external returns (bool){
        if (this.isCustomerWhiteListed(msg.sender)){
            if (this.customerTierLevel(msg.sender)==2){
                _mint(msg.sender, 200);
                return true;
            }else if (this.customerTierLevel(msg.sender)==1){
                _mint(msg.sender, 100);
                return true;
            }
            return false;
        }
        return false;
    }

    function buyToken() external payable returns (bool){        
        if (this.isCustomerWhiteListed(msg.sender)){
            if (this.customerTierLevel(msg.sender)==2){
                uint256 amount = 20 * msg.value;
                _mint(msg.sender, amount);
                return true;
            }else if (this.customerTierLevel(msg.sender)==1){
                uint256 amount = 10 * msg.value;
                _mint(msg.sender, amount);
                return true;
            }
            return false;
        }
        return false;
    }

    function addWhitelist(address _ad) public  {
        whitelist.push(_ad);
    }

    function removeWhitelist(address _ad) public  {
        address[] memory tmpWhitelist = whitelist;
        whitelist = new address[](0); // Reset the whitelist

        for (uint i = 0; i < tmpWhitelist.length; i++){
            if(tmpWhitelist[i] != _ad){
                whitelist.push(tmpWhitelist[i]);
            } 
        }
    }

    function isCustomerWhiteListed(address _ad) external returns(bool){
        for (uint i = 0; i < whitelist.length; i++){
            if(whitelist[i] == _ad){
                return true;
            } 
        }
        return false;
    }

    function updateTier(address _ad, uint256 _tier, bool _val) public  {
        if (_tier == 1) {
            tier1[_ad] = _val;
        }else if (_tier == 2) {
            tier2[_ad] = _val;
        }
        
    }

    function customerTierLevel(address _ad) external returns(uint256){
        if(tier2[_ad]){
            return 2;
        } 
        else{
            if(tier1[_ad]){
                return 1;
            }
            else{
                return 0;
            }
        }
    }

}

