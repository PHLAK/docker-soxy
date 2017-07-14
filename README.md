docker-soxy
===========

Docker image for SOCKS proxy client (inspired by [Soxy](https://github.com/PHLAK/Soxy)).

[![](https://images.microbadger.com/badges/image/phlak/soxy.svg)](http://microbadger.com/#/images/phlak/soxy "Get your own image badge on microbadger.com")

Running the Container
---------------------

First generate an SSH key pair and store it in a named data volume:

    docker run --rm -v soxy-key:/vol/key --entrypoint keygen phlak/soxy docker-soxy

This will generate a new SSH key pair and echo back the public key.  You must then manually add this
key to your server's `known_hosts` file.  Once complete you can run the SOCKS proxy client with:

    docker run -d -p 1080:1080 -v soxy-key:/vol/key --name soxy-client phlak/soxy user@hostname [-p 1234]

**NOTE:** Replace `user@hostname [-p 1234]` with your server's user and hostname. You may also set
the port number with the `-p` flag if your server isn't running on the default port (22).

Once the Soxy client is up and running you can connect to it via `localhost:1080`.

#### Optional 'docker run' arguments

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.

Troubleshooting
---------------

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-soxy/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-soxy/blob/master/LICENSE).
