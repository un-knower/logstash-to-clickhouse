#! /bin/sh

docker run --rm -it \
--name logstsah \
-v $(pwd)/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
-v $(pwd)/logstash.yml:/usr/share/logstash/config/logstash.yml \
-v $(pwd)/logstash-output-clickhouse-0.1.0.gem:/usr/share/logstash/bin/logstash-output-clickhouse-0.1.0.gem \
-p 5044:5044 \
docker.elastic.co/logstash/logstash:5.6.3 /bin/bash