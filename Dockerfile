FROM docker.elastic.co/elasticsearch/elasticsearch:7.4.2@sha256:ef0cdf17f8d00d8d90a7872b6672bc44283c6204e86bdf0067f93e9f637aad2a

RUN bin/elasticsearch-plugin install ingest-attachment

# remove x-pack because of license problems spamming log file with massive amounts of errors
RUN bin/elasticsearch-plugin remove x-pack --purge \
    &&  sed -i 's/^xpack/#xpack/' config/elasticsearch.yml

