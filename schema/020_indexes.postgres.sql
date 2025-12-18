-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  encryption_events

CREATE INDEX IF NOT EXISTS idx_enc_events_entity ON encryption_events (entity_table, entity_pk, created_at);
