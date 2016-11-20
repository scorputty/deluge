#!/bin/sh

set -e

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for downloads
test -d /downloads || exit 2

# start deluge daemon
exec /usr/bin/deluged -c /config -d -l /config/daemon.log -L info &

# start deluge-web
exec /usr/bin/deluge-web -c /config  -l /config/web.log -L info &

wait
