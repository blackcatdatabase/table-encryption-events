-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-11-27T15:36:13Z)
-- engine: postgres
-- table:  encryption_events

-- Contract view for [encryption_events]
CREATE OR REPLACE VIEW vw_encryption_events AS
SELECT
  id,
  entity_table,
  entity_pk,
  field_name,
  op,
  policy_id,
  local_key_version,
  layers,
  outcome,
  error_code,
  created_at
FROM encryption_events;
