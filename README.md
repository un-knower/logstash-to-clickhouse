# For plainn csv file input to clickhouse

`git checkout csv-location`

# For gzip csv logstash input file example

`git checkout gzip-csv`

# logstash-to-clickhouse example

This repo is for me to record how to use logstash, filebeat and some logstash plugins to insert data from files to clickhouse database table. Refer to this [great post](https://www.altinity.com/blog/2017/12/18/logstash-with-clickhouse):

### working OS info

1. Docker version 18.09.6 on Ubuntu 18.04

## Start the logstash to clickhouse example steps

1. `./up-clickhouse-server.sh`
2. `./connect-clickhouse-client.sh`
3. In clickhouse-client cli,

```
USE default;
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
```

After created table, exit by `Ctrl+D`

4. set `logstash.conf` to your local machine ip

from

```
output {
    clickhouse {
      http_hosts => ["http://192.168.3.78:8123"]
      table => "nginx_access"
...
```

to

```
output {
    clickhouse {
      http_hosts => ["http://yourlocalip:8123"]
      table => "nginx_access"
```

5. `./start-logstash.sh` access to the bash in logstash container

6. install logstash plugins and start logstash manually, it may take a few minutes to install plugins and start the logstash server, just wait for it.

in container bash

```
cd /usr/share/logstash/bin
./logstash-plugin install logstash-filter-prune
./logstash-plugin install logstash-filter-multiline
./logstash-plugin install logstash-output-clickhouse-0.1.0.gem
./logstash
```

after seeing `[INFO ][logstash.agent ] Successfully started Logstash API endpoint {:port=>9600}`,
keep logstash server on and `open a new terminal`.

7. `./connect-clickhouse-client.sh` to check clickhouse if recive logs

```
SELECT * FROM location
```

10. Done, exit all containers and clean clickhouse server data by `sudo rm -rf ./dbdata`

## References

https://www.altinity.com/blog/2017/12/18/logstash-with-clickhouse
