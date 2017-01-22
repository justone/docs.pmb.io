# Custom RabbitMQ Setup

If you are adding PMB users to an existing RabbitMQ setup, using an entirely new virtual host is recommended.

## Step 1. Create the username and password.

Click on the "Admin" tab at the top and expand the "Add a user" section.

![Add User](getting_started/add.png)

## Step 2. Add permissions for the new user.

Click on the username after creating it and expand the "Permissions" section.  Note that the permissions MUST begin with the username.

![Add User](getting_started/perms.png)

## Step 3. Create the AMQP(S) url

```
                         proto   user   password    hostname
$ export PMB_PRIMARY_URI=amqps://jimbob:supersecret@mq.jimbob.com/
```

Note that the virtual host for the URL starts immediately after the hostname, so the virtual host above is `/`.  See the [specification](http://www.rabbitmq.com/uri-spec.html) for full details.

