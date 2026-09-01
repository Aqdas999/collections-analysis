# Collections Analytics — Data Analyst Assignment

## Executive Summary

This project independently investigates the business claim:

> **"Recovery has improved by 11% month-on-month."**

The objective was not simply to reproduce a reported KPI, but to determine whether the claim remains valid after reconstructing the underlying data, validating metric definitions, investigating data-quality issues, analysing performance drivers, and testing the impact of a mid-period targeting strategy change.

The analysis follows a **Raw → Forensics → Golden → Metrics → Drivers → Counterfactual → Decision** framework.

### Key conclusion

The reported **11% month-on-month improvement is not supported** by the independently reconstructed complete-month recovery data for January–July 2026.

Observed monthly recovery was volatile rather than consistently improving:

| Month | MoM Recovery Change |
|---|---:|
| February | -9.05% |
| March | +11.11% |
| April | -7.38% |
| May | +5.20% |
| June | -4.60% |
| July | +6.48% |

The average observed month-on-month change across these complete months was approximately **+0.29%**, substantially below the reported 11%.

August was excluded from the normal monthly trend because the available payment data covers only part of the month.

The investigation also found that several operational metrics can be materially distorted by data grain, denominator choice, attribution logic and incomplete operational history. Therefore, the analysis distinguishes between:

- **Fact** — directly supported by reconstructed data
- **Strong Evidence** — supported by multiple analytical checks
- **Correlation** — an observed relationship without causal identification
- **Hypothesis** — a plausible explanation requiring experimentation

---

# 1. Business Questions

The analysis addresses four core business questions.

### 1. What actually happened?

Reconstruct collections performance independently of the reported business claim.

This includes:

- Monthly recovery trends
- Recovery efficiency
- Portfolio and targeting mix
- Account and borrower characteristics
- Channel and campaign performance
- Agent and operational performance
- Identification of misleading or unstable metrics

### 2. Why did performance change?

Investigate whether observed changes were associated with:

- DPD
- Risk / borrower segment
- Client
- Geography
- Language
- Agent
- Agent tenure
- Campaign
- Channel
- Vendor
- Calling time
- Attempt frequency
- Targeting strategy
- Borrower/account characteristics

The analysis deliberately separates observed associations from causal conclusions.

### 3. Is the reported 11% improvement real?

Independent definitions and calculations are required for metrics such as:

- Contact rate
- Right-party contact (RPC)
- PTP rate
- PTP kept rate
- Recovery rate
- Recovery per account
- Recovery per agent-hour
- Cost per ₹ recovered
- Channel conversion

The purpose is to establish whether the reported improvement is a genuine change in collection effectiveness or a consequence of denominator, attribution, portfolio-mix or data-quality effects.

### 4. Where should ₹10 Cr be invested?

The analysis evaluates the available strategic options:

- Telephony
- Additional agents
- AI voice
- Better borrower targeting
- WhatsApp / digital engagement
- Field operations

The decision framework focuses on:

- Incremental recovery
- Cost
- ROI
- Break-even
- Downside risk
- Confidence in the estimate
- Evidence required before deployment

Where the available data is insufficient to estimate these quantities reliably, the analysis explicitly states the limitation rather than fabricating an ROI.

---

# 2. Analytical Approach

The investigation was structured as a sequence of analytical layers rather than a single exploratory notebook.

**Raw Data → Data Profiling → Forensics → Golden Dataset → Performance → Drivers → Counterfactual → Investment Decision**

This separates data validation from business interpretation and prevents unreliable KPIs from being used as decision metrics.
---



# 3. Data Profiling & Forensics

Before analysing performance, the available datasets were profiled for:

- Row counts and unique keys
- Missing values
- Date coverage
- Duplicate records
- Relationship integrity
- Event-level grain
- Metric inflation risks

The data covers borrowers, accounts, agents, campaigns, targeting, calls, dispositions, digital interactions, field visits, PTPs, payments, telephony, complaints and account status history.

### Key issues identified

**Multiple dispositions per call**

A call can have multiple disposition records. A naive join can therefore multiply call-level rows and inflate metrics such as RPC.

**PTP / payment mismatch**

PTP outcomes do not always map cleanly to successful payments, so PTP performance and confirmed recovery are treated as separate concepts.

**Incomplete periods**

December 2025 has limited operational history, while August 2026 has incomplete payment coverage. These periods are therefore treated separately from the comparable monthly trend.

**Denominator sensitivity**

Metrics such as recovery rate, recovery/account and recovery/agent-hour can change significantly depending on the population and denominator used.
---

# 4. Golden Dataset

The Golden layer is intended to be the curated analytical representation of the source data rather than a direct copy of Raw.

Key principles:

- Preserve raw data unchanged
- Maintain explicit analytical grain
- Resolve entity identity before important joins
- Deduplicate using business logic
- Preserve legitimate repeated events
- Handle timestamps consistently
- Track exclusions and corrections
- Quantify material cleaning impact

The cleaning process distinguishes between technical duplicates, conflicting records, legitimate repeated events and unresolved anomalies.
---

# 8. Performance Reconstruction

Monthly recovery was independently reconstructed from confirmed successful payment events.

### Observed MoM recovery

| Month | MoM Change |
|---|---:|
| February | -9.05% |
| March | +11.11% |
| April | -7.38% |
| May | +5.20% |
| June | -4.60% |
| July | +6.48% |

The pattern does not show sustained 11% month-on-month growth.

March shows approximately +11%, but this is followed by a decline in April.

Therefore:

> **A single month of ~11% growth does not establish sustained 11% MoM improvement.**
---
# 9. Why the Claim Can Be Misleading

Aggregate recovery can move because of changes in:

- Number of targeted accounts
- Portfolio composition
- Outstanding balance
- DPD mix
- Borrower segment
- Campaign mix
- Targeting strategy

Therefore, higher total recovery does not necessarily mean higher collection effectiveness.

Recovery/account and other efficiency measures provide a complementary view to absolute recovery.
---
# 10. Driver Analysis

Performance was examined across operational and borrower dimensions including DPD, risk segment, campaign, channel, vendor, calling time and attempt frequency.

These comparisons are treated as **observational** unless the populations are sufficiently comparable.

For example, if SMS shows higher recovery/account, this does not automatically mean SMS is more effective. SMS may have been disproportionately assigned to accounts with different DPD, balances, risk or borrower characteristics.

The analysis therefore distinguishes:

- **Fact**
- **Strong Evidence**
- **Correlation**
- **Hypothesis**
---

# 11. Selection & Mix Effects

Month-on-month recovery can be affected by changes in the population being targeted.

Important factors include:

- DPD distribution
- Risk segment
- Outstanding balance
- Client mix
- Geography
- Prior recovery
- Targeting eligibility
- Account survivorship

This makes it important to compare like-for-like populations before attributing aggregate changes to operational effectiveness.
---

# 12. Targeting Strategy & Counterfactual

A targeting strategy change occurred during the analysis period.

A simple pre/post counterfactual was constructed using:

**Pre-change:** January–March 2026

**Post-change:** April–July 2026

The pre-change recovery/account baseline was applied to the post-change targeted-account population.

| Measure | Recovery |
|---|---:|
| Actual post-change recovery | ₹72.27 Cr |
| Estimated counterfactual | ₹74.57 Cr |
| Difference | **-₹2.31 Cr** |

This suggests that observed post-change recovery was below the simple baseline estimate.

However, this is **observational and not causal**. The result can be affected by portfolio mix, DPD, seasonality, targeting volume and other operational changes.

---
# 14. Recommended Experiment

Run a controlled test comparing:

**Treatment:** New targeting strategy

**Control:** Existing targeting strategy

Where feasible, randomise at account level.

If randomisation is not possible, adjust or match on factors such as:

- DPD
- Client
- Geography
- Risk segment
- Prior recovery
- Outstanding balance
- Account characteristics

### Primary KPI

**Incremental recovery per targeted account**

### Secondary KPIs

- Recovery rate
- Recovery/agent-hour
- Cost/₹ recovered
- PTP kept rate
- Contact/RPC
- Complaint rate

Scale the investment only if the treatment produces a meaningful incremental recovery after accounting for cost.

----

# 15. Confidence & Limitations

### Moderate confidence

- The complete-month data does not support sustained 11% MoM recovery growth.
- Monthly recovery is volatile.
- Data-quality and grain issues can materially distort collection KPIs.

### Lower confidence

- Causal impact of the targeting strategy
- Incremental recovery attributable to targeting
- ROI of the proposed ₹10 Cr investment
- Relative superiority of individual channels without stronger adjustment

The main limitation is the lack of experimental and detailed cost data required to establish causal financial impact.

---

# 20. Final Decision

### Business claim

> **"Recovery has improved by 11% month-on-month."**

### Assessment

**Not supported by the independently reconstructed complete-month data.**

### What the data shows

Recovery is volatile, with approximately **+0.29% average observed MoM growth** across the complete January–July period rather than sustained 11% growth.

### What the data does not establish

The current data does not establish a causal improvement attributable to the targeting strategy or provide a reliable ROI for deploying ₹10 Cr.

### Recommended action

**Do not commit the full ₹10 Cr yet.**

Prioritise a controlled experiment for **better borrower targeting**, using incremental recovery per targeted account as the primary decision metric and measuring cost, operational efficiency and customer-experience guardrails.

---