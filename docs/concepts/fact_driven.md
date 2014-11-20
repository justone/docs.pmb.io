# Overview

Fact Driven Development (FDD) is a style of development and deployment that is characterized by its emphasis on the communication of granular facts rather than centrally-held control. The software or system is broken down into components that are each responsible for a logical subsystem and thus that subsystems' facts. Each component communicates those facts whenever appropriate and can re-communicate as long as they are true.

When facts are received (or "heard"), components can choose to react to them by doing work and optionally generating (and broadcasting) new facts.  If a particular component doesn't care about a specific fact, then it can simply be ignored.

Facts are typically communicated in a asynchronous fashion, either over a central message broker or point to point.

# Benefits

* **Loose coupling between components** - Each component is only able to communicate with other components via messages.  This greatly simplifies interaction.
* **Resilience to change** - Components aren't able to reach inside of each other, and so the internal design of each component can change as long as any messages emitted are consistent.
* **Ease of testing** - Since all contact with external systems is via messages, simulating interactions for unit testing can be done by manufacturing different messages and feeding them into components.
* **Clear delineation of components** - 

# Example

1. Upon receiving a new commit, a git service announces that the commit is present, with information about where to retrieve it and who did the commit.  Other components react to that commit by creating build jobs or

# Core Tenets

Each component in an FDD software system should:

* Broadcast facts that it knows to be true.
* React to facts that it perceives from other components.

It should not:

* Concern itself with the internal state of any other component
