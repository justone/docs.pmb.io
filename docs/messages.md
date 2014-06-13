<style type="text/css">
table, th, td {
    border: 1px solid grey;
    padding: 4px;
}
</style>

Agents communicate by sending messages.  This page describes the messages that are produced by the various built-in agents.

# Common attributes

All messages contain the following fields:

| Name | Description | Example |
| ------------ | ------------- | ------------ |
| id | a string identifying which agent sent the message | remoteCopy-f24ed38ccd5f |
| sent | a date/time stamp of when the message was sent | 2014-06-13T06:23:52-07:00 |
| ip | the IP address of the sending agent | 1.2.3.4 |
| hostname | the hostname of the sending agent | domain.com |

For example, here is a message that the remotecopy agent would send:

```
{
  "type": "CopyData",
  "data": "foobar",
  "sent": "2014-06-13T06:23:52-07:00",
  "ip": "10.0.1.104",
  "id": "remoteCopy-f24ed38ccd5f",
  "hostname": "icarus.local"
}
```

# Remote copy

# Notification

# Introduction
