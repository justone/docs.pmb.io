# Getting started

To use PMB, you need two things:

1. A RabbitMQ instance, with appropriate username/password set up.
2. The `pmb` binary itself.

# Getting RabbitMQ

All messages flow through a RabbitMQ server.  However, almost none of the advanced feathers are used. Instead, a single topic exchange is created, each connection gets its own queue, and all connections get all messages.

The necessary configuration is:

1. A username and password. (e.g. jimbob/supersecret)
2. Permission for the user to $username-* for exchanges, channels, and queues. (e.g. jimbob-*)

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

## Bootstrap

```
$ curl get.pmb.io/stable/bootstrap
$ curl get.pmb.io/testing/bootstrap
```

## Binary

```
$ curl get.pmb.io/stable/binary
$ curl get.pmb.io/testing/binary
```
