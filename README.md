# Collections Analytics — Data Analyst Assignment

## Objective

Independently reconstruct collections performance, investigate the reported 11% month-on-month recovery improvement, identify the major drivers, evaluate the targeting strategy change, and assess the ₹10 Cr investment decision.

## Project Structure

* `data/` — raw and golden datasets
* `notebooks/` — analysis notebooks
* `reports/` — analytical outputs and data-quality reports
* `dashboard/` — executive dashboard
* `docs/` — executive memo and architecture diagram

## Analysis Flow

Raw Data → Data Quality & Forensics → Golden Dataset → Performance Analysis → Driver Analysis → Counterfactual → Production Design → Executive Outputs

## Key Finding

The reported **11% MoM recovery improvement is not supported** by the independently reconstructed complete-month data.

January–July 2026 showed volatile monthly recovery changes, with average observed MoM growth of approximately **0.29%**.

August was excluded from the normal MoM comparison because the available payment data only covers part of the month.

## Data Quality

Important issues identified include:

* Multiple dispositions associated with calls
* Potential RPC inflation from naive call/disposition joins
* Partial August data
* Limited December operational data
* PTP/payment status inconsistencies
* Insufficient cost data for reliable ROI calculation

These issues were documented and incorporated into the analytical methodology.

## Counterfactual

A simple pre/post counterfactual treated January–March as the pre-change period and April–July as the post-change period.

Actual post-change recovery was approximately **₹72.27 Cr**, compared with approximately **₹74.57 Cr** under the estimated counterfactual.

The resulting **−₹2.31 Cr difference is an observational estimate, not causal proof**.

## Investment Recommendation

The available observational data does not support a reliable ROI estimate for a full ₹10 Cr deployment.

Better borrower targeting is recommended as the area for further investment, but the strategy should first be validated through a controlled experiment.

The experiment should measure incremental recovery per targeted account, recovery per agent-hour, cost per ₹ recovered, and statistical confidence in the treatment effect.

## Reproducibility

The notebooks contain the data profiling, cleaning, golden-layer construction, performance analysis, driver analysis, counterfactual analysis, and production analytics design used to produce the final outputs.
