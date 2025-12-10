# encryption_events

Audit of cryptographic operations.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| field_name | VARCHAR(64) | NO |  | Target field. |
| local_key_version | VARCHAR(64) | YES |  | Local key version used. |
| id | BIGINT | NO |  | Surrogate primary key. |
| op | mysql: ENUM('encrypt','decrypt','rotate','rehash','unwrap','wrap') / postgres: TEXT | NO |  | Operation performed. (enum: encrypt, decrypt, rotate, rehash, unwrap, wrap) |
| outcome | mysql: ENUM('success','failure') / postgres: TEXT | NO |  | Result. (enum: success, failure) |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp (UTC). |
| policy_id | BIGINT | YES |  | Applied policy (FK encryption_policies.id), optional. |
| entity_table | VARCHAR(64) | NO |  | Entity table name. |
| error_code | VARCHAR(64) | YES |  | Error code when failure. |
| layers | mysql: JSON / postgres: JSONB | YES |  | JSON list of layers/steps. |
| entity_pk | VARCHAR(64) | NO |  | Entity primary key. |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_enc_events_entity | entity_table,entity_pk,created_at | INDEX idx_enc_events_entity (entity_table, entity_pk, created_at) |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_enc_events_entity | entity_table,entity_pk,created_at | CREATE INDEX IF NOT EXISTS idx_enc_events_entity ON encryption_events (entity_table, entity_pk, created_at) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_encryption_events | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_encryption_events | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
