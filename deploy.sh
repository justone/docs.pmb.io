#!/bin/bash

set -e
SITE=docs.pmb.io

if [[ $DRONE_BRANCH == "master" ]]; then
    rsync -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/$SITE/html/
else
    ssh endot.org@endot.org mkdir -p /home/54/domains/${DRONE_BRANCH}-$SITE/html/
    rsync -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/${DRONE_BRANCH}-$SITE/html/
fi
