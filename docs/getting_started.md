<style type="text/css">
img {
border: 1px solid grey;
}
</style>
# Getting started

To use PMB, you need two things:

1. A RabbitMQ instance, with appropriate username/password set up.
2. The `pmb` binary itself.

# Getting RabbitMQ

All messages flow through a RabbitMQ server.  However, almost none of RabbitMQ's advanced features are used. Instead, a single topic exchange is created, each connection gets its own queue, and all connections get all messages.

The necessary setup is:

1. A username and password. (e.g. jimbob/supersecret)
2. Permission for the user to $username-\* for configure, write, and read. (e.g. jimbob-\*)

## Docker image

Running the pre-built docker image `nate/quick-pmb` will set up RabbitMQ, create a user with the proper permissions and then display the necessary client config in the container logs:

```
$ docker run -p 5671 -p 15672 -d --name quickpmb nate/quick-pmb
6ce9bee7ce5b928286636d4209781cd9437627a8589f7330b5bab5452e7e3bd4
$ docker logs quickpmb
Waiting for rabbit@fbd94fec711e ...
pid is 43 ...

              RabbitMQ 3.3.1. Copyright (C) 2007-2014 GoPivotal, Inc.
  ##  ##      Licensed under the MPL.  See http://www.rabbitmq.com/
  ##  ##
  ##########  Logs: /var/log/rabbitmq/rabbit@fbd94fec711e.log
  ######  ##        /var/log/rabbitmq/rabbit@fbd94fec711e-sasl.log
  ##########
              Starting broker... completed with 10 plugins.
...done.
Creating user "pmb" ...
...done.
Setting permissions for user "pmb" in vhost "/" ...
...done.
Changing password for user "guest" ...
...done.

Quick Personal Message Bus Docker container.

    USER: pmb
    PASS: ooghahbooghuwoo
    ADMIN USER: guest
    ADMIN PASS: iesaigoogaexeku

    CONFIG for PMB:

    export PMB_PRIMARY_URI=amqps://pmb:ooghahbooghuwoo@[hostname]:[port]/
    export PMB_SSL_INSECURE_SKIP_VERIFY=1

$ docker port quickpmb 5671
0.0.0.0:49156
```

Replace `[hostname]` and `[port]` with your hostname and the port shown in the `docker port` output.

The `PMB_SSL_INSECURE_SKIP_VERIFY` environment variable allows PMB to work with self signed certificates.

## Custom setup

If you are adding PMB users to an existing RabbitMQ setup, using an entirely new virtual host is recommended.

### Step 1. Create the username and password.

Click on the "Admin" tab at the top and expand the "Add a user" section.

![Add User](add.png)

### Step 2. Add permissions for the new user.

Click on the username after creating it and expand the "Permissions" section.  Note that the permissions MUST begin with the username.

![Add User](perms.png)

### Step 3. Create the AMQP(S) url

```
                         proto   user   password    hostname
$ export PMB_PRIMARY_URI=amqps://jimbob:supersecret@mq.jimbob.com/
```

Note that the virtual host for the URL starts immediately after the hostname, so the virtual host above is `/`.  See the [specification](http://www.rabbitmq.com/uri-spec.html) for full details.

# Getting `pmb`

Personal Message Bus is a single binary, so installing it is very simple. There are three ways of installing.

## Bootstrap

The bootstrap is a small perl script that will download and run the correct binary after verifying its MD5 signature. Installing via this method is recommended for those using [dfm](https://github.com/justone/dfm) or otherwise managing dotfiles with git, because only the small script is managed and not the full 5mb+ binary.

```
$ curl get.pmb.io/stable/bootstrap > ~/.dotfiles/bin/pmb
```

Running the script for the first time will download the binary from get.pmb.io and run it with the supplied arguments:

```
$ pmb introducer
Fetching http://get.pmb.io/2014-05-22-0628-41ad571/pmb_linux_amd64
2014-06-06 15:26:55 INFO  introducer.go:42 Introducer ready.
```

Running the same command again won't re-download.  To upgrade to a newer version, just download the bootstrap again, either from one of the above URLs or a [specific version](http://get.pmb.io).

## Binary

This method is best for when you know exactly which version and platform you need.

One downside to this is that you have to manually verify the MD5 signature after download.

```
$ curl get.pmb.io/stable/pmb_linux_amd64 > /usr/local/bin/pmb
$ curl -s get.pmb.io/stable/sums
41063676cd78ce392c6c0c0d3a33104f  pmb_darwin_amd64
07b5bab067d7af35dd2a336e2d26c685  pmb_linux_amd64
$ md5sum /usr/local/bin/pmb
07b5bab067d7af35dd2a336e2d26c685
```

## OS Packages

Coming soon.
