<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – encryption_events

Audit of cryptographic operations.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| entity_table | VARCHAR(64) | NO | — | Entity table name. |  |
| entity_pk | VARCHAR(64) | NO | — | Entity primary key. |  |
| field_name | VARCHAR(64) | NO | — | Target field. |  |
| op | TEXT | NO | — | Operation performed. | enum: encrypt, decrypt, rotate, rehash, unwrap, wrap |
| policy_id | BIGINT | YES | — | Applied policy (FK encryption_policies.id), optional. |  |
| local_key_version | VARCHAR(64) | YES | — | Local key version used. |  |
| layers | JSONB | YES | — | JSON list of layers/steps. |  |
| outcome | TEXT | NO | — | Result. | enum: success, failure |
| error_code | VARCHAR(64) | YES | — | Error code when failure. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp (UTC). |  |