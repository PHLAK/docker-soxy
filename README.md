docker-soxy
===========

<p align="center">
    <a href="https://github.com/PHLAK/docker-soxy/discussions"><img src="https://img.shields.io/badge/Join_the-Community-7b16ff.svg?style=for-the-badge" alt="Join the Community"></a>
    <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg?style=for-the-badge" alt="Become a Sponsor"></a>
    <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg?style=for-the-badge" alt="One-time Donation"></a>
    <br>
    <a href="https://hub.docker.com/repository/docker/phlak/soxy/tags"><img alt="Docker Image Version" src="https://img.shields.io/docker/v/phlak/soxy?style=flat-square&sort=semver"></a>
    <a href="https://hub.docker.com/repository/docker/phlak/soxy"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/phlak/soxy?style=flat-square"></a>
    <a href="https://github.com/PHLAK/docker-soxy/blob/master/LICENSE"><img src="https://img.shields.io/github/license/PHLAK/docker-soxy?style=flat-square" alt="License"></a>
    <a href="https://hub.docker.com/repository/docker/phlak/soxy/builds"><img alt="Docker Cloud Build Status" src="https://img.shields.io/docker/cloud/build/phlak/soxy?style=flat-square"></a>
</p>

<p align="center">
    Docker image for SOCKS proxy client (inspired by
    <a href="https://github.com/PHLAK/Soxy">Soxy</a>).
</p>

---

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

For general help and support join our [GitHub Discussions](https://github.com/PHLAK/docker-soxy/discussions) or reach out on [Twitter](https://twitter.com/PHLAK).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-soxy/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-soxy/blob/master/LICENSE).
