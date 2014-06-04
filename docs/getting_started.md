# Getting started

To use PMB, you need two things:

1. A RabbitMQ instance, with appropriate username/password set up.
2. The `pmb` binary itself.

# Getting RabbitMQ

All messages flow through a RabbitMQ server.  However, almost none of the advanced feathers are used. Instead, a single topic exchange is created, each connection gets its own queue, and all connections get all messages.

The necessary configuration is:

1. A username and password. (e.g. jimbob/supersecret)
2. Permission for the user to $username-\* for exchanges, channels, and queues. (e.g. jimbob-\*)

[TODO: Picture of permissions]

## Docker image

Running the pre-built docker image `nate/quick-pmb` will set up RabbitMQ, create a user with the proper permissions and then display the necessary client config in the container logs:

```
$ docker run -d nate/quick-pmb
CCCCCCCCCCC
$ docker logs CCCCCCCCCCC
[TODO: logs showing PMB URL]
```

## Custom setup

[TODO: Walkthrough adding user and perms, recommend a separate virtual host]

# Getting `pmb`

Personal Message Bus is a single binary, so installing it is very simple. There are three ways of installing. 

## Bootstrap

The bootstrap is a small perl script that will download and run the correct binary after verifying its MD5 signature. Installing via this method is recommended for those using [dfm](https://github.com/justone/dfm) or otherwise managing dotfiles with git, because only the small script is managed and not the full 5mb+ binary.

```
$ curl get.pmb.io/stable/bootstrap > ~/.dotfiles/bin/pmb
$ curl get.pmb.io/testing/bootstrap > ~/.dotfiles/bin/pmb
```

Running the script for the first time will download the binary from get.pmb.io and run it with the supplied arguments:

```
$ pmb introducer
[TODO: fill in fetching message and introducer start message]
```

Running the same command again won't re-download.  To upgrade to a newer version, just download the bootstrap again, either from one of the above URLs or a [specific version](http://get.pmb.io).

## Binary

This method is best for when you know exactly which version and platform you need.

One downside to this is that you have to manually verify the MD5 signature after download.

```
$ curl get.pmb.io/stable/pmb_linux_amd64 > /usr/local/bin/pmb
$ curl get.pmb.io/testing/pmb_linux_amd64 > /usr/local/bin/pmb
$
$ md5sum /usr/local/bin/pmb
[TODO: add example md5sum]
```

## OS Packages

Coming soon.
