# encryption_events

Audit of cryptographic operations.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp (UTC). |
| entity_pk | VARCHAR(64) | NO |  | Entity primary key. |
| entity_table | VARCHAR(64) | NO |  | Entity table name. |
| error_code | VARCHAR(64) | YES |  | Error code when failure. |
| field_name | VARCHAR(64) | NO |  | Target field. |
| id | BIGINT | NO |  | Surrogate primary key. |
| layers | JSONB | YES |  | JSON list of layers/steps. |
| local_key_version | VARCHAR(64) | YES |  | Local key version used. |
| op | TEXT | NO |  | Operation performed. (enum: encrypt, decrypt, rotate, rehash, unwrap, wrap) |
| outcome | TEXT | NO |  | Result. (enum: success, failure) |
| policy_id | BIGINT | YES |  | Applied policy (FK encryption_policies.id), optional. |

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
| vw_encryption_events | mysql | algorithm=MERGE, security=INVOKER | [packages\encryption-events\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/encryption-events/schema/040_views.mysql.sql) |
| vw_encryption_events | postgres |  | [packages\encryption-events\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/encryption-events/schema/040_views.postgres.sql) |
