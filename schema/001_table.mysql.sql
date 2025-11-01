-- Auto-generated from schema-map-mysql.psd1 (map@c5e4097)
-- engine: mysql
-- table:  encryption_events
CREATE TABLE IF NOT EXISTS encryption_events (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  entity_table VARCHAR(64) NOT NULL,
  entity_pk VARCHAR(64) NOT NULL,
  field_name VARCHAR(64) NOT NULL,
  op ENUM('encrypt','decrypt','rotate','rehash','unwrap','wrap') NOT NULL,
  policy_id BIGINT UNSIGNED NULL,
  local_key_version VARCHAR(64) NULL,
  layers JSON NULL,
  outcome ENUM('success','failure') NOT NULL,
  error_code VARCHAR(64) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  INDEX idx_enc_events_entity (entity_table, entity_pk, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
