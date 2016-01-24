#!/bin/bash

set -e
SITE=docs.pmb.io

mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo "endot.org ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA6t/F1UXfLPJxzuCsnYafDAWEyq9740FDPjN9o/fPDwn3lIMJafR4qjHYkrksI+8LKJc/xyvzZcxLLXPmK4Bl2Ui0s1VOsG/1jRmLqql1jMU+eMVeBUIgsc1qRyg3o/sVjpwgDjE7EUNRIfCaU5yivJZRsAqkFkJ6fDx4puMzPQU=" > /root/.ssh/known_hosts
echo -e $PRIV_KEY | tr -d '"' > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

if [[ $DRONE_BRANCH == "master" ]]; then
  echo "Syncing to main site $SITE"
  rsync -v -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/$SITE/html/
else
  echo "Syncing to branch site ${DRONE_BRANCH}-$SITE"
  ssh endot.org@endot.org mkdir -p /home/54/domains/${DRONE_BRANCH}-$SITE/html/
  rsync -v -aze 'ssh -p 22' site/ endot.org@endot.org:/home/54/domains/${DRONE_BRANCH}-$SITE/html/
fi
