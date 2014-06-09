The Personal Message Bus is configured entirely with environment variables.  This page lists all available variables.

# PMB_PRIMARY_URI

This is the [RabbitMQ URI](http://www.rabbitmq.com/uri-spec.html) that indicates where all agents should connect.  This URI is not a secret.  The intent is that this environment variable should be added to a [managed dotfiles repository](https://github.com/justone/dotfiles) so that it is available on every system that PMB agents are run.

```
$ export PMB_PRIMARY_URI=amqps://jimbob:supersecret@mq.jimbob.com/
```

# PMB_SSL_INSECURE_SKIP_VERIFY

If the RabbitMQ instance is using a self signed certificate, then this environment variable must be set to `1`:

```
export PMB_SSL_INSECURE_SKIP_VERIFY=1
```

# PMB_KEY

This is the shared encryption key. This key should be kept secret and not be committed to version control.

This environment variable is not usually set.  It should only be set when agents need to run without prompting for the key.

```
export PMB_KEY=b2de0d2537b4bd37bd4bcb3754449c4f
```
