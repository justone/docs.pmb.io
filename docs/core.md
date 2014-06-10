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

# Plugin

The `pmb plugin` command facilitates running arbitrary programs to consume and produce messages.
