# Instructions: Extending the Paid Ads MCDM

This project implements a Marketing Common Data Model (MCDM) for **Paid Ads Basic Performance** using dbt + BigQuery.  
It consolidates raw data from multiple ad platforms (Facebook, TikTok, Bing, Twitter) into a single unified table:  

**`mcdm_paid_ads_basic_performance`**

---

## 🚀 How to Add Data from a New Ad Platform

When integrating a new advertising platform into the MCDM, follow these steps:

### 1. Add the Raw Data
- Place the raw exported data into the `seeds/` folder (or connect via source if it comes from an external table).  
- Use a clear naming convention: `src_ads_<platform>_all_data.csv`  
  Example: `src_ads_snapchat_all_data.csv`

### 2. Define the Source in dbt
- Update `models/mcdm/schema.yml` with a new `source:` block for the new dataset.  
- This ensures dbt can reference the raw platform data consistently.

### 3. Map to the MCDM Fields
- Open `models/mcdm/mcdm_paid_ads_basic_performance.sql`.  
- Add a new `UNION ALL` block for the new platform.  
- Select and rename the raw platform columns to match the **MCDM schema**:

| MCDM Field       | Description                                    | Example Mapping (Facebook)       |
|------------------|-----------------------------------------------|----------------------------------|
| `ad_id`          | Unique identifier for the ad                  | `ad_id`                          |
| `channel`        | Source platform                               | `'facebook'`                     |
| `date`           | Date of activity                              | `date`                           |
| `impressions`    | Number of times an ad was shown               | `impressions`                    |
| `clicks`         | User clicks                                   | `clicks`                         |
| `spend`          | Ad spend in platform’s currency               | `spend`                          |
| `conversions`    | Conversions attributed to the ad              | `conversions`                    |

If the raw platform does not provide a field:
- Map to `NULL` but keep the column in the select.
- Example: `NULL AS conversions`

### 4. Run and Test
- Rebuild seeds:  
  ```bash
  dbt seed
