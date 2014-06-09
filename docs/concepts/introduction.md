# Introduction

All Personal Message Bus agents encrypt their messages, and since agents connect on an adhoc basis, there needs to be a method of distributing the shared encryption key. The purpose of introduction is to make this distribution quick and easy.

First, the introducer agent needs to be running locally.  This agent remains running and is the keeper of the encryption key.

```
$ pmb introducer
2014-06-06 15:26:55 INFO  introducer.go:42 Introducer ready.
```

Then, when an unauthenticated agent is run, it requests the key by sending an unencrypted message.  For example, this runs the `long_process.rb` script and sends a notification when it completes:

```
$ pmb notify -- long_process.rb
```

When this command is run, the following happens:

1. The notify agent sends an unencrypted message of type "RequestAuth" and prompts for the secret.
2. The introducer agent reacts to the "RequestAuth" message by copying the encryption key into the local clipboard.
3. The user then simply pastes the key into the prompt and the notify agent can now send secure encrypted messages.

In the above case, the notify agent will send a "DisplayNotification" message when the `long_process.rb` process finishes. The introducer agent reacts to that by displaying an appropriate message to the user (e.g. via Growl).

