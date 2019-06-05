#! /bin/sh

docker run --rm -it --name=filebeat --user=root \
--volume="$(pwd)/sample-nginx-logs/:/var/log/nginx/" \
--volume="$(pwd)/filebeat.docker.yml:/usr/share/filebeat/filebeat.yml" \
docker.elastic.co/beats/filebeat:5.6.3 filebeat -e -strict.perms=false


#https://www.elastic.co/guide/en/beats/libbeat/5.3/config-file-permissions.html
#https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html