# Docker image

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

