# Stable-Reserve Coin (bUSD)

`bUSD` is a decentralised reserve asset that keeps **price ≥ 1 USDT** via over-collateralisation and algorithmic bonds.

| Parameter | Value |
| --------- | ----- |
| Initial Mint | 50 000 bUSD @ 4 USDT |
| Backing | 400 % (BLUE + TON + USDT) |
| Rebase Epoch | 8 h |
| Initial Rebase | 0.39 % |

## Bond Markets  

| Term | Initial Discount | APR* |
| ---- | ---------------- | ---- |
| 5 d  | 94.5 % | 5.5 % |
| 14 d | 84 %   | 16 % |
| 30 d | 72 %   | 36 % |
| 90 d | 45 %   | 155 % |

\*After discount → realised over term.

## Peg Defence  
* Treasury auto-buyback when bUSD < 1 USDT by 10 % for 7 days.  
* Sell-side 5 % fee funds buyback pot.

## Treasury Backing Formula  

$$
Backing Ratio = (Treasury BLUE × mvBLUE + Treasury TON × mvTON + Treasury USDT)
--------------------------------------------------------------- ≥ 4
bUSD_total_supply
$$

