<style type="text/css">
img {
border: 1px solid grey;
}
</style>
# Overview

To use PMB, you need to do the following:

1. Get access to a RabbitMQ instance, with appropriate username/password set up.
2. Get the `pmb` binary itself.
3. Run the introducer.
4. Run PMB agents.

# 1. Getting RabbitMQ

All messages flow through a RabbitMQ server.  However, almost none of RabbitMQ's advanced features are used. Instead, a single topic exchange is created, each connection gets its own queue, and all connections get all messages.

The necessary setup is:

1. A username and password. (e.g. jimbob/supersecret)
2. Permission for the user to $username-\* for configure, write, and read. (e.g. jimbob-\*)

There are two ways to set up RabbitMQ:

1. Use the [`nate/quick-pmb` Docker image](rabbitmq_docker_image.md).  This works well for temporary use.
2. [Add a user and access](add_to_existing_rabbitmq.md) to an existing RabbitMQ instance.

# 2. Getting `pmb`

Personal Message Bus is a single binary, so installing it is very simple.

There are four ways of installing.

## Holen

If you're already using [holen](https://github.com/holen-app/holen), then all that's needed is to link `pmb`:

```
$ holen link pmb
```

## Bootstrap

The bootstrap is a small perl script that will download and run the correct binary after verifying its MD5 signature. Installing via this method is recommended for those using [dfm](https://github.com/justone/dfm) or otherwise managing dotfiles with git, because only the small script is managed and not the full 5mb+ binary.

Note that this method doesn't currently work on Windows.

```
$ curl -L get.pmb.io/latest > ~/.dotfiles/bin/pmb
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

```
$ curl http://get.pmb.io/2014-05-22-0628-41ad571/pmb_linux_amd64 > /usr/local/bin/pmb
$ chmod +x /usr/local/bin/pmb
```

## OS Packages

Coming soon.

# 3. Running the introducer

All agents in a PMB system connect and authenticate via a process called introduction.  For more information about introduction, see [its documentation](concepts/introduction.md).  Introduction is coordinated by a local process called the introducer.  To configure and run the introducer:

```
$ export PMB_PRIMARY_URI=amqps://jimbob:supersecret@mq.jimbob.com/
$ pmb introducer
2014-06-06 15:26:55 INFO  introducer.go:42 Introducer ready.
```

# 4. Run PMB agents

Once the introducer is running, any PMB agent can be run.  The only [configuration](configuration.md) that is necessary is the `$PMB_PRIMARY_URI` environment variable, pointing to the RabbitMQ instance.

```
$ export PMB_PRIMARY_URI=amqps://jimbob:supersecret@mq.jimbob.com/
$ pmb remotecopy foo
$ pmb run -- long_process.rb
```
