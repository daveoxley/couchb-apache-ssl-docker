FROM daveoxley/apache-proxy-ssl
MAINTAINER Dave Oxley <couchdb-docker@oxley.email>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    couchdb apache2-utils && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i '/port = /s/^;//g' /etc/couchdb/local.ini && \
    sed -i '/bind_address = /s/^;//g' /etc/couchdb/local.ini && \
    a2enmod authz_groupfile

COPY default-proxy.conf /etc/apache2/proxy-conf/

COPY start.sh /
CMD ["/start.sh"]
