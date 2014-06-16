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

Example message:

```
{
  "sent": "2014-06-13T06:23:52-07:00",
  "ip": "192.168.4.12",
  "id": "remoteCopy-f24ed38ccd5f",
  "hostname": "mydomain.local"
  ... message specific attributes ...
}
```

# Remote copy

Remote copy has two messages.

## CopyData

This message represents data to be copied.  The only additional attribute is `data`, which is the data itself.  Example message:

```
{
  "type": "CopyData",
  "data": "foobar",
  ... common attributes ...
}
```

## DataCopied

This message indicates that copy data was in fact copied to a clipboard.  The only additional attribute is `origin`, which contains the id of the agent that originally requested the copy.

```
{
  "type": "DataCopied",
  "origin": "remoteCopy-f24ed38ccd5f",
  ... common attributes ...
}
```

# Notification

Notification uses two message types.

## Notification

This message indicates that a notification should be displayed.  The only additional attribute is `message`, which is the message to display. Example message:

```
{
  "type": "Notification",
  "message": "The process is finished.",
  ... common attributes ...
}
```

## NotificationDisplayed

This message indicates that the notification was displayed.  The only additional attribute is `origin`, which contains the id of the agent that originally requested the notification.

```
{
  "type": "NotificationDisplayed",
  "origin": "notify-dfc245fe38cd",
  ... common attributes ...
}
```

# Introduction
