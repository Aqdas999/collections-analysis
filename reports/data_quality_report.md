# Data Quality Report

## 1. Executive Finding

The raw collections data contains several issues that can materially distort recovery and operational metrics. The most important finding is that multiple disposition records can exist for a single call, meaning a naive call-to-disposition join can inflate RPC above 100%.

August 2026 is also a partial month and was excluded from the normal month-on-month recovery comparison. December 2025 contains only limited call activity and was excluded from the recovery trend.

## 2. Data Quality Issues

| Issue                          | Detection                                           | Treatment                                           | Business Impact                                     |
| ------------------------------ | --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- |
| Multiple dispositions per call | Counted dispositions by `call_id`                   | Do not calculate RPC from naive row-level join      | Can inflate RPC above 100%                          |
| RPC inflation                  | RPC exceeded mathematically possible 100%           | Excluded unvalidated RPC from final decision-making | Prevents misleading contact-performance conclusions |
| Partial August data            | Payment data ends August 8                          | Excluded August from MoM trend                      | Prevents artificial recovery decline                |
| December spillover             | Very limited December recovery/call activity        | Excluded December from recovery trend               | Prevents invalid baseline                           |
| PTP/payment mismatch           | Compared PTP status with nearby successful payments | Flagged for business-rule validation                | PTP kept-rate reliability is uncertain              |
| Missing cost data              | No reliable operational cost table                  | Cost per ₹ recovered not calculated                 | Investment ROI cannot be reliably estimated         |

## 3. Timestamp Treatment

Event timestamps were converted to datetime values before analysis.

August was treated as a partial observation because payment data ends on August 8, 2026. Complete-month comparisons therefore use January through July 2026.

## 4. Payment Treatment

Only payment records with `payment_status = SUCCESS` were included when calculating recovery.

Recovery was aggregated at account level before joining to account attributes to avoid multiplying payment amounts through joins.

## 5. Disposition Treatment

Disposition records were not assumed to be one-to-one with calls.

The analysis identified multiple disposition records associated with calls. Because a validated rule for selecting the authoritative disposition was not available, RPC was not used as a final investment decision metric.

## 6. PTP Validation

PTP records contain explicit statuses including `KEPT`, `BROKEN`, `CANCELLED`, and `OPEN`.

The initial resolved PTP kept rate was calculated as:

`KEPT / (KEPT + BROKEN)`

However, validation against successful payments within a ±3-day window showed limited agreement. This window is an analytical assumption and should not be treated as the definitive business rule.

## 7. Key Assumptions

* Successful payments represent valid recovery.
* January–July 2026 are the complete months suitable for MoM comparison.
* August 2026 is incomplete.
* December 2025 is not a valid recovery baseline.
* The targeting strategy changed around April 2026 for counterfactual analysis.
* The counterfactual assumes pre-change recovery efficiency would have continued without the targeting change.

## 8. Limitations

The current data does not provide sufficient evidence to establish causal impact of the targeting change.

Reliable cost-per-recovery and ROI calculations also require collection cost data such as agent cost, telephony cost, messaging cost, field-operation cost and automation cost.

## 9. Recommended Data Controls

Production pipelines should enforce:

* Primary-key uniqueness
* Foreign-key validation
* Duplicate detection
* Schema-change detection
* Timestamp validation
* Late-arriving event handling
* Payment-status validation
* Disposition-to-call cardinality checks
* Daily row-count monitoring
* Metric anomaly alerts
