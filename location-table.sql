CREATE TABLE IF NOT EXISTS location
(
    `subscribe_id` String,
    `device` String,
    `device_model` String,
    `started_at` DateTime,
    `ended_at` DateTime,
    `lat` Nullable(Float64),
    `long` Nullable(Float64),
    `position` String,
    `signal` String
)
ENGINE = MergeTree()
PARTITION BY toYYYYMMDD(started_at)
ORDER BY started_at
SETTINGS index_granularity = 8192