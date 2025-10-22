<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – encryption_events

Audit of cryptographic operations.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| entity_table | VARCHAR(64) | NO | — | Entity table name. |  |
| entity_pk | VARCHAR(64) | NO | — | Entity primary key. |  |
| field_name | VARCHAR(64) | NO | — | Target field. |  |
| op | ENUM('encrypt','decrypt','rotate','rehash','unwrap','wrap') | NO | — | Operation performed. | enum: encrypt, decrypt, rotate, rehash, unwrap, wrap |
| policy_id | BIGINT UNSIGNED | YES | — | Applied policy (FK encryption_policies.id), optional. |  |
| local_key_version | VARCHAR(64) | YES | — | Local key version used. |  |
| layers | JSON | YES | — | JSON list of layers/steps. |  |
| outcome | ENUM('success','failure') | NO | — | Result. | enum: success, failure |
| error_code | VARCHAR(64) | YES | — | Error code when failure. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp (UTC). |  |