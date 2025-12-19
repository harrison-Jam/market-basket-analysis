# Market Basket Analysis (MySQL)

## Overview
This project performs a Market Basket Analysis using MySQL on transactional data.
It identifies frequently co-purchased products using:

- Support
- Confidence
- Lift

## Dataset Structure
Table: `transaction`

| Column | Description |
|------|------------|
| Order_ID | Unique order identifier |
| product | Product name |

## Analysis
- Self-join used to generate product pairs
- Support = frequency of pair / total orders
- Confidence = P(B | A)
- Lift = association strength

## Key Findings
Top product bundles were identified using lift and confidence metrics.

## Tools
- MySQL

---

## 👤 Author
Aremu James

