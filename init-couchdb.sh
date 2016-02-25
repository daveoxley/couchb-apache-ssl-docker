#!/bin/sh

echo "$COUCHDB_USER = $COUCHDB_PWD" >> /etc/couchdb/local.ini
/usr/bin/htpasswd -cb /etc/apache2/passwords $COUCHDB_USER $COUCHDB_PWD
echo "admin: $COUCHDB_USER" > /etc/apache2/groups
rm -rf /var/lib/couchdb
mkdir /conf/couchdb
ln -sf /conf/couchdb /var/lib/couchdb
mkdir -p /run/couchdb
