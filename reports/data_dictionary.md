# Data Dictionary

## Project: Mutual Fund Analytics

This document describes the datasets used in the Mutual Fund Analytics project, along with the meaning of each field and its source.

---

## 1. Fund Master Dataset

This dataset contains the master information for all mutual fund schemes.

| Column Name   | Description                                              |
| ------------- | -------------------------------------------------------- |
| amfi_code     | Unique scheme code assigned by AMFI                      |
| scheme_name   | Name of the mutual fund scheme                           |
| fund_house    | Asset Management Company (AMC) offering the scheme       |
| category      | Main category of the scheme (Equity, Debt, Hybrid, etc.) |
| sub_category  | Detailed classification within the category              |
| risk_category | Risk level associated with the scheme                    |

Source: Fund Master File

---

## 2. NAV History Dataset

This dataset stores historical Net Asset Value (NAV) information for mutual fund schemes.

| Column Name | Description                    |
| ----------- | ------------------------------ |
| amfi_code   | Scheme identifier              |
| date        | Date on which NAV was recorded |
| nav         | Net Asset Value of the scheme  |

Source: Historical NAV Data / MFAPI

---

## 3. Investor Transactions Dataset

This dataset contains investor purchase and redemption transactions.

| Column Name      | Description                                    |
| ---------------- | ---------------------------------------------- |
| transaction_id   | Unique identifier for each transaction         |
| investor_id      | Unique investor identifier                     |
| amfi_code        | Scheme code associated with the transaction    |
| transaction_date | Date of transaction                            |
| transaction_type | Type of transaction (SIP, Lumpsum, Redemption) |
| amount           | Amount involved in the transaction             |
| kyc_status       | Investor KYC verification status               |
| state            | Investor's state/location                      |

Source: Investor Transactions File

---

## 4. Scheme Performance Dataset

This dataset provides performance metrics for mutual fund schemes.

| Column Name   | Description                              |
| ------------- | ---------------------------------------- |
| amfi_code     | Scheme identifier                        |
| return_1yr    | One-year return percentage               |
| return_3yr    | Three-year return percentage             |
| return_5yr    | Five-year return percentage              |
| expense_ratio | Annual expense ratio charged by the fund |

Source: Scheme Performance File

---

## 5. AUM Dataset

This dataset contains Assets Under Management information for mutual funds.

| Column Name | Description                   |
| ----------- | ----------------------------- |
| amfi_code   | Scheme identifier             |
| aum         | Total Assets Under Management |
| report_date | Date of AUM reporting         |

Source: AUM by Fund Dataset

---

### Data Quality Checks Performed

* Converted date fields to standard datetime format.
* Removed duplicate records from NAV history data.
* Validated NAV values to ensure they are greater than zero.
* Standardized transaction types into SIP, Lumpsum, and Redemption.
* Verified transaction amounts are positive.
* Checked KYC status values for consistency.
* Validated scheme return fields as numeric values.
* Reviewed expense ratios and flagged values outside the expected range.

Prepared as part of Day 2 –

 Data Cleaning and Database Design.
