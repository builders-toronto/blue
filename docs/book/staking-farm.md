# Staking Farm

## Goal  
Reward long-term BLUE holders without inflating supply.

## Mechanics  
* Users stake BLUE → contract locks tokens.  
* Contract issues **sBLUE** (non-transferable) as accounting shares.  
* Rewards pulled from a pre-funded pool (0.2 B BLUE) plus 50 % of all DEX trading fees routed by an off-chain relayer.  
* Unstake penalty decays linearly from 10 % (day 0) to 0 % after 60 days—penalties recycle into rewards pool.

## Math  

*reward_per_block = (pool_balance × emission_rate) / total_sBLUE*


## Governance Hook  
After 30 days stakers may vote on treasury proposals; voting weight = sBLUE balance × stake duration score.

## Upgrade Path  
Phase 2 will let LP tokens (BLUE/bUSD) be staked for dual rewards:  
* 70 % in BLUE (from rewards pool)  
* 30 % in bUSD (from protocol fees)
