-- Business metrics
CREATE SCHEMA IF NOT EXISTS metrics;

CREATE TABLE metrics.monthly_recovery AS
SELECT
    DATE_TRUNC('month', event_at)::date AS month,
    SUM(amount) AS recovery,
    COUNT(DISTINCT account_id) AS recovered_accounts
FROM clean.payments
WHERE payment_status = 'SUCCESS'
GROUP BY 1
ORDER BY 1;

-- Data-quality check: multiple dispositions per call
SELECT
    call_id,
    COUNT(*) AS disposition_count
FROM staging.call_dispositions
GROUP BY call_id
HAVING COUNT(*) > 1;
