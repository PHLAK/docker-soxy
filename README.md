docker-soxy
===========

Docker image for SOCKS proxy client (inspired by [Soxy](https://github.com/PHLAK/Soxy)).

[![](https://badge.imagelayers.io/phlak/soxy:latest.svg)](https://imagelayers.io/?images=phlak/soxy:latest 'Get your own badge on imagelayers.io')


### Running the container

First create a data-only container containing your SSH key pair:

    docker run --entrypoint /usr/bin/keygen --name soxy-keys phlak/soxy:local docker-soxy

This will generate a new SSH key pair and echo back the public key.  You must then manually add this
key to your server's `known_hosts` file.  Once complete you can run the SOCKS proxy client with:

    docker run -d -p 1080:1080 --volumes-from socks-keys --name socks-client phlak/soxy user@hostname [-p 1234]

**NOTE:** Replace `user@hostname [-p 1234]` with your server's user and hostname. You may also set
the port number with the `-p` flag if your server isn't running on the default port (22).


##### Optional 'docker run' arguments

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.


-----

**Copyright (c) 2016 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
