#! /bin/sh
# if permission denied use below command
# sudo chmod -R 757 ./logstash-logs

sudo docker run --rm -it \
 --privileged=true -i \
--name logstash \
-v $(pwd)/sample-csv/:/sample-csv/ \
-v $(pwd)/logstash-logs/:/data/ \
-v $(pwd)/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
-v $(pwd)/logstash.yml:/usr/share/logstash/config/logstash.yml \
-v $(pwd)/logstash-output-clickhouse-0.1.0.gem:/usr/share/logstash/bin/logstash-output-clickhouse-0.1.0.gem \
-p 5044:5044 \
docker.elastic.co/logstash/logstash:7.1.1 /bin/bash

# permission error 
# https://stackoverflow.com/questions/49414167/error-permission-denied-usr-share-logstash-sincedb-sincedb