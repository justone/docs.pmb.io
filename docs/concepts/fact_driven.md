# Overview

Fact Driven Development (FDD) is a style of development and deployment that is characterized by its emphasis on granular facts rather than overarching control. The software or system is broken down into components that are each responsible for a logical subsystem and thus that subsystems facts.

Facts are communicated whenever appropriate and can be re-communicated as long as they are true. Typically, facts are communicated over an asynchronous message bus. Facts can either be broadcast to all components or only sent to those listeners that are interested.

# Example

TBW

# Core Tenets

Each component in an FDD software system should:

* Broadcast facts that it knows to be true.
* React to facts that it perceives from other components.

It should not:

* Concern itself with the internal state of any other component
