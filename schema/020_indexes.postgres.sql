-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  encryption_events

CREATE INDEX IF NOT EXISTS idx_enc_events_entity ON encryption_events (entity_table, entity_pk, created_at);
