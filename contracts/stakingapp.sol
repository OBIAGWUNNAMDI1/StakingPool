//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-ethereum-package/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/utils/ReentrancyGuard.sol";
import ".IERC20.sol";

contract stakingcontract is Ownable, ReentrancyGuard{
    struct Stake{
        uint256 stakeamount;
        address staker;
        uint256 timestamp;
    }
    uint private _totalSupply;
    
    address BoredApe = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d";
    Token public StakingToken;
    address[] internal stakeholder;
    mapping (address => uint256) StakingAmount;
    mapping (address => uint256) stakingTime;
    mapping(address => bool) StakingCheck;
    mapping(address =>Stake)Stakeusers;
    mapping(address => unit) balances

    modifier minStake(uint256 amount){
        require(amount >100, "monimumstake");
        _;
    }

    modifier BoredApe(address _eoa){
        require (IERC721(BoredApe).balanceof(_eoa) > 1);
        _;
    }

     function rewardPerToken() public view returns (uint) {
        if (_totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored +
            (((block.timestamp - lastUpdateTime) * rewardRate * 1e18) / _totalSupply);
    }
     function earned(address account) public view returns (uint) {
        return
            ((_balances[account] *
                (rewardPerToken() - userRewardPerTokenPaid[account])) / 1e18) +
            rewards[account];
    }

    modifier updateReward(address account) {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = block.timestamp;

        rewards[account] = earned(account);
        userRewardPerTokenPaid[account] = rewardPerTokenStored;
        _;
    }
    
    function stake(uint256 amount) external minStake BoredApe(msg.sender) {
        _totalSupply = _totalSupply.add(amount);
        _balances[msg.sender] = _balances[msg.sender].add(amount);
        stakingToken.safeTransferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    function rewards(){}
    function withdraw(){}
    function withdrawAll(){}

}
