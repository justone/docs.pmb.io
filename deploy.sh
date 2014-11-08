#!/bin/bash

set -e

if [[ $DRONE_BRANCH == "master" ]]; then
  rsync -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/docs.pmb.io/html/
else
    ssh endot.org@endot.org mkdir -p /home/54/domains/${DRONE_BRANCH}-docs.pmb.io/html/
    rsync -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/${DRONE_BRANCH}-docs.pmb.io/html/
fi
