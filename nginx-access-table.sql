CREATE TABLE IF NOT EXISTS nginx_access
(
    `logdate` Date,
    `logdatetime` DateTime,
    `request` String,
    `agent` String,
    `os` String,
    `minor` String,
    `auth` String,
    `ident` String,
    `verb` String,
    `patch` String,
    `referrer` String,
    `major` String,
    `build` String,
    `response` UInt32,
    `bytes` UInt32,
    `clientip` String,
    `name` String,
    `os_name` String,
    `httpversion` String,
    `device` String
)
ENGINE = MergeTree(logdate, (logdatetime, clientip, os), 8192)