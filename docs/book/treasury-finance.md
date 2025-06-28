# Treasury & Finance Architecture

## Initial Balances  

| Asset | Amount |
| ----- | ------ |
| BLUE  | 0.5 B |
| TON   | 30 000 |
| USDT  | 250 000 |

Multi-sig: 3-of-5 (core team + community reps)

## Revenue Streams  
* 2 % materials marketplace fee  
* 1 % micro-loan origination fee  
* 50 % of DEX trading fees (via relayer)  
* Bond premiums & staking penalties  

## Expenditure Policy  
| Bucket | % |
|--------|---|
| Oracle Gas Subsidy | 25 |
| Dev Grants / Audits | 25 |
| Marketing & Events | 15 |
| DAO Vote Incentives | 15 |
| Insurance ETF Buy-in | 20 |

## Insurance ETF  
20 % of net profit auto-allocated quarterly:  
* 40 % ETH • 30 % BTC • 15 % TON • 15 % stTON  
Users with **12-month negative ROI** may claim proportional coverage.

## Auto-Buyback  
If BLUE 7-day VWAP drops > 10 %:  
`buy_amount = 0.10 × treasury_USDT` executes via STON.fi and locks tokens.
