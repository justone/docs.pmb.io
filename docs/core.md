# Remote copy

The `pmb remotecopy` command copies data into your local clipboard.  This is useful for getting data from remote processes so that it can be pasted into an email, chat window or another remote terminal window.

The data to be copied can be provided one of two ways.  The first is as an argument to the command.  The following will copy "copydata" into the local clipboard.

```
$ pmb remotecopy copydata
```

The second way that data can be provided is to pipe it into the `pmb remotecopy` call.  The following will copy the last three lines of a file into the local clipboard.

```
$ tail -n 3 interesting.c | pmb remotecopy
```

# Notify

The `pmb notify` command causes a notification to be displayed on your local machine (typically with Growl).

It can be used to send a single notification.  This will pop up a local notification:

```
$ pmb notify -m 'Hello World'
```

A more useful feature of the notify agent is that it can wait to send the notification until a process has finished.

This runs a process and sends a notification after it completes:

```
$ pmb notify -- long_process.rb
```

And this will watch an existing process and send a notification on completion:

```
$ pmb notify -p 12345
```

# Plugin

The `pmb plugin` command facilitates running arbitrary programs to consume and produce messages.

# Introducer

The `pmb introducer` command's main purpose is to facilitate [introduction](concepts/introduction.md), but it also provides the following functionality:

* When a remote copy is initiated, this agent is the one that actually does the local clipboard manipulation.
* When a notification is requested, this agent uses Growl to display the notification.
