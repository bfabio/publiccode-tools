FROM elasticsearch:6.8.4

ENV ELASTIC_SERVER https://elasticsearch.developers.italia.it
ENV ELASTIC_DUMP_FILE out.dump

ENV network.host 0.0.0.0
ENV discovery.type single-node
ENV http.cors.enabled  true
ENV http.cors.allow-origin  *

RUN set -o pipefail \
        ; \
        curl -sL https://rpm.nodesource.com/setup_10.x | bash - \
        && yum install -y nodejs \
        && npm install -g elasticdump \
        && elasticdump --input "$ELASTIC_SERVER" --output "$ELASTIC_DUMP_FILE"

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
