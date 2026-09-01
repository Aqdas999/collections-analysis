-- Clean layer
CREATE SCHEMA IF NOT EXISTS clean;

-- Remove duplicate payment records
CREATE TABLE clean.payments AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY payment_id
               ORDER BY event_at DESC
           ) AS rn
    FROM staging.payments
) x
WHERE rn = 1;
