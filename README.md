docker-soxy
===========

<p align="center">
  <a href="http://microbadger.com/#/images/phlak/soxy" alt="Microbadger"><img src="https://images.microbadger.com/badges/image/phlak/soxy.svg"></a>
  <a href="https://ln.phlak.net/join-slack"><img src="https://img.shields.io/badge/Join_our-Slack-611f69.svg" alt="Join our"></a>
  <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg" alt="Become a Sponsor"></a>
  <a href="https://patreon.com/PHLAK"><img src="https://img.shields.io/badge/Become_a-Patron-e7513b.svg" alt="Become a Patron"></a>
  <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg" alt="One-time Donation"></a>
</p>

<p align="center">
    Docker image for SOCKS proxy client (inspired by
    <a href="https://github.com/PHLAK/Soxy">Soxy</a>).
</p>

---

#### Like this project?

[![Join the community on Spectrum](https://img.shields.io/badge/Join_the_community-PHLAKNET-7a15fe.svg)](https://spectrum.chat/phlaknet)
[![Become a Patron](https://img.shields.io/badge/Become_a-Patron-f96854.svg)](https://patreon.com/PHLAK)
[![One-time Donation](https://img.shields.io/badge/Make_a-Donation-006bb6.svg)](https://paypal.me/ChrisKankiewicz)

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

For general help and support join our [Slack Workspace](https://ln.phlak.net/join-slack).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-soxy/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-soxy/blob/master/LICENSE).
