-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  encryption_events
CREATE INDEX idx_enc_events_entity ON encryption_events (entity_table, entity_pk, created_at);
