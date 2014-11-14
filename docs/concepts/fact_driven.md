# Overview

Fact Driven Development (FDD) is a style of development and deployment that is characterized by its emphasis on the communication of granular facts rather than centrally-held control. The software or system is broken down into components that are each responsible for a logical subsystem and thus that subsystems' facts. Each component communicates those facts whenever appropriate and can re-communicate as long as they are true.

When facts are received (or "heard"), components can choose to react to them by doing work and optionally generating (and broadcasting) new facts.  If a particular component doesn't care about a specific fact, then it can simply be ignored.

Facts are typically communicated in a asynchronous fashion, either over a central message broker or point to point.

# Benefits

## Loose coupling between components

## Resilient to change

## Clear delineation of components

# Example

1. Upon receiving a new commit, a git service announces that the commit is present, with information about where to retrieve it and who did the commit.  Other components react to that commit by creating build jobs or

# Core Tenets

Each component in an FDD software system should:

* Broadcast facts that it knows to be true.
* React to facts that it perceives from other components.

It should not:

* Concern itself with the internal state of any other component
