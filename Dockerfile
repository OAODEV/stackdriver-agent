FROM debian:jessie

RUN apt-get update && \
    apt-get install -y \
    postgresql-client \
    lsb-release \
    curl

ENV PGPASSWORD requires_pgpassword

ADD postgresql.conf /opt/stackdriver/collectd/etc/collectd.d/

RUN curl -O "https://repo.stackdriver.com/stack-install.sh"

CMD bash stack-install.sh --write-gcm && service stackdriver-agent restart
