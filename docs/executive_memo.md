# Executive Memo — Collections Performance Review

## What happened?

The reported claim that recovery improved by **11% month-on-month** is not supported by the independently reconstructed data for complete months from **January through July 2026**.

Observed MoM recovery was volatile:

* February: **−9.05%**
* March: **+11.11%**
* April: **−7.38%**
* May: **+5.20%**
* June: **−4.60%**
* July: **+6.48%**

Average observed MoM growth was approximately **+0.29%**, substantially below the reported 11%.

August was excluded because payment data only runs through August 8 and therefore represents a partial month.

## Why did it happen?

Recovery efficiency was relatively stable when measured as recovery per targeted account and recovery per agent-hour. This suggests that changes in total recovery were influenced substantially by the number and composition of accounts being targeted rather than a broad 11% improvement in collection effectiveness.

The targeting mix changed only modestly across FIELD, SMS, VOICE and WHATSAPP.

A simple pre/post counterfactual using January–March as the pre-change period estimates:

**Actual post-change recovery:** ₹72.27 Cr
**Counterfactual recovery:** ₹74.57 Cr
**Estimated difference:** −₹2.31 Cr

This indicates that post-change recovery was below the assumed pre-change baseline.

This is an observational counterfactual and **should not be interpreted as proof that the targeting change caused a ₹2.31 Cr loss**.

## Data quality and confidence

The analysis identified several issues that can materially distort operational metrics.

Multiple disposition records can exist for a single call. A naive call-to-disposition join produced RPC values above 100%, demonstrating that the join grain can inflate metrics. RPC was therefore excluded from final investment decisions until a validated call-level disposition rule is established.

PTP records also require validation because recorded `KEPT` status did not consistently correspond with successful payments within the analytical validation window.

December 2025 was excluded from the recovery trend because it contains only limited operational activity. August 2026 was excluded because it is incomplete.

**Confidence:** Moderate in the conclusion that the reported sustained 11% improvement is not supported; low in causal attribution and investment ROI.

## What should we do?

The current data does not provide enough evidence to justify allocating the full ₹10 Cr to telephony, additional agents, AI voice, WhatsApp/digital engagement or field operations.

The recommended area for further investment is **better borrower targeting**, but the ₹10 Cr should **not be committed immediately**.

Instead, run a controlled targeting experiment with treatment and control groups matched or randomized on factors such as:

* DPD
* client
* geography
* borrower segment
* prior recovery history
* account characteristics

The primary decision metric should be **incremental recovery per targeted account**, supported by recovery per agent-hour and cost per ₹ recovered.

## Expected financial impact

A reliable incremental recovery, ROI and break-even estimate cannot be calculated from the current data because causal treatment-effect evidence and detailed intervention-cost data are unavailable.

The current observational counterfactual estimates approximately **₹2.31 Cr lower post-change recovery** than the assumed pre-change baseline.

This should be treated as a warning signal rather than an investment return estimate.

**Recommendation:** validate better borrower targeting through a controlled experiment before deploying the full ₹10 Cr.
