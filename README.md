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

```text
Raw Data
   ↓
Data Profiling & Quality Assessment
   ↓
Data Forensics
   ↓
Golden Dataset
   ↓
Performance Reconstruction
   ↓
Driver Analysis
   ↓
Counterfactual Analysis
   ↓
Investment Decision
   ↓
Production Analytics Design
   ↓
Executive Outputs