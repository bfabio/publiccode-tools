FROM elasticsearch:6.8.4

ENV ELASTIC_SERVER https://elasticsearch.developers.italia.it
ENV ELASTIC_DUMP_FILE out.dump

ENV ES_JAVA_OPTS -Xms256m -Xmx1g
ENV cluster.name es-cluster
ENV node.name es1
ENV network.bind_host 0.0.0.0
ENV discovery.type single-node
ENV xpack.security.enabled false
ENV xpack.monitoring.enabled false
ENV xpack.watcher.enabled false
ENV xpack.ml.enabled false
ENV http.cors.enabled  true
ENV http.cors.allow-origin  *
ENV http.cors.allow-methods  OPTIONS, HEAD, GET, POST, PUT, DELETE
ENV http.cors.allow-headers  X-Requested-With,X-Auth-Token,Content-Type, Content-Length

RUN set -o pipefail \
        ; \
        curl -sL https://rpm.nodesource.com/setup_10.x | bash - \
        && yum install -y nodejs \
        && npm install -g elasticdump \
        && elasticdump --input "$ELASTIC_SERVER" --output "$ELASTIC_DUMP_FILE"

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
