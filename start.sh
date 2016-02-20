#!/bin/bash

mkdir /run/couchdb
echo "admin = $ACRA_PWD" >> /etc/couchdb/local.ini
/usr/bin/htpasswd -cb /etc/apache2/passwords admin $ACRA_PWD
rm -rf /var/lib/couchdb
mkdir /conf/couchdb
ln -sf /conf/couchdb /var/lib/couchdb
/usr/bin/couchdb -b
/usr/sbin/apachectl -e info -DFOREGROUND
