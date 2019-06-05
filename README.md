# Logstash csv file input example

since `filebeat` cannot parser gzip comressed file so this branch is another example repo for parse gzip compressed csv file to clickhouse. For plain text file example, `git checkout filebeat`.

## Steps

1. `$ ./start-logstash.sh`
2. in container `$ /usr/share/logstash/bin/logstash`

will see parsed csv output in the console

## IMPORTANT

files in `./sample-csv` will be deleted after parsed by logstash
