-- Golden analytical layer
CREATE SCHEMA IF NOT EXISTS golden;

CREATE TABLE golden.account_recovery AS
SELECT
    account_id,
    SUM(amount) AS recovery,
    COUNT(DISTINCT payment_id) AS payment_count
FROM clean.payments
WHERE payment_status = 'SUCCESS'
GROUP BY account_id;
