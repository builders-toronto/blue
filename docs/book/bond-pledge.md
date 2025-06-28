# Bond-Pledge Agreement

## 1 · Rationale  
Self-owned liquidity (DeFi 2.0) removes permanent reliance on mercenary yield farmers.  
The bond-pledge contract lets contributors swap bUSD + LP tokens for **discounted BLUE**—locking depth into the DEX pool and adding fee income to the treasury.

## 2 · How it Works  
1. **Deposit** bUSD → contract  
2. Contract routes:  
   * 50 % bUSD → buy BLUE → pairs into BLUE/bUSD LP  
   * 20 % bUSD → buy BLUE spot (supports price)  
   * 30 % bUSD → treasury reserve  
3. User receives **Bond NFT** with a vesting schedule.  
4. At maturity the NFT redeems BLUE + bonus (discount %) back to the wallet.

## 3 · Dynamic Discount Table  

| Global Bond Ratio | Discount | Notes |
| ----------------- | -------- | ----- |
| 0 – 10 % supply   | 0 %      | boot-strap phase |
| 10 – 20 %         | 15 %     | attracts mid TVL |
| 20 – 40 %         | 40 %     | target equilibrium |
| 40 – 60 %         | 60 %     | late-stage; max depth |
| > 60 %            | 75 %     | circuit-breaker to avoid overbonding |

## 4 · Product Tiers  

| Tier | Deposit Range (bUSD) | Comp-Power Multiplier | Vesting |
| ---- | -------------------- | --------------------- | ------- |
| Starter | 25 – 500 | 1.6× | 7 days |
| Pro     | 500 – 5 000 | 2.0× | 14 days |
| Enterprise | 5 000 – 50 000 | 2.4× | 30 days |

## 5 · Smart-Contract Notes  
* Written in **Tact** (TIP-3 aware).  
* Emits Bond NFT (TIP-64) so wallets can track vesting.  
* Uses STON.fi router for swaps & LP minting.  
* Owner = Treasury multi-sig (upgradeable via DAO vote).

Full ABI & FunC/Tact sources will be published before audit.
