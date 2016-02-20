## Couchdb with Apache https proxy server

A Docker container to run couchdb proxied by an Apache https server.

Create a directory conf to hold SSL key, SSL certificate and additional Apache config files.
Put ssl key and certificate into conf as server.key and server.crt respectively.
Create one or more files ending with .conf to hold proxy and any additional Apache configuration.

```apache
ServerAdmin webmaster@example.com
```

By default access to / requires the admin user. To remove this restriction for specific databases add the following apache conf file.
```apache
<Location /exampledb>
        ProxyPass http://127.0.0.1:5984/exampledb retry=10
        AuthType None
        Require all granted
</Location>
```

The container will create the databases under the conf directory in a subdirectory called couchdb. If you have existing databases, create this directory first and copy them in before starting the instance.

From within the conf directory run docker mounting the current dir as /conf and mapping port 443 to the host:

```bash
$ docker run -it -e COUCHDB_USER=admin -e COUCHDB_PWD=123 -p 443:443 -v `pwd`:/conf -d daveoxley/couchdb-apache-proxy-ssl
```
