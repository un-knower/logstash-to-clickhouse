#!/bin/bash

echo -------- START up-clickhouse-server.sh !!
docker run -d --name some-clickhouse-server \
-p 8123:8123 \
-v $(pwd)/dbdata:/var/lib/clickhouse \
--ulimit nofile=262144:262144 \
yandex/clickhouse-server

echo -------- DONE up-clickhouse-server.sh !!
