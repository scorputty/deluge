#!/usr/bin/env bash

# edit for your situation
VOL_CONFIG="/Volumes/shares/docker/config/deluge"
VOL_DOWNLOADS="/Volumes/shares/docker/data/deluge/downloads"

test -d ${VOL_CONFIG} || VOL_CONFIG="${PWD}${VOL_CONFIG}" && mkdir -p ${VOL_CONFIG}
test -d ${VOL_DOWNLOADS} || VOL_DOWNLOADS="${PWD}${VOL_DOWNLOADS}" && mkdir -p ${VOL_DOWNLOADS}

docker run -d -h $(hostname) \
    -p 8112:8112 \
    -p 58846:58846 \
    -p 58946:58946 \
    -v ${VOL_DOWNLOADS}:/downloads \
    -v ${VOL_CONFIG}:/config \
    -e TZ=Europe/Amsterdam \
    -e PUID=1000 \
    -e PGID=1000 \
    --name=deluge --restart=always cryptout/deluge

  # for troubleshooting run
  # docker exec -it deluge /bin/bash
  # to check logs run
  # docker logs -f deluge
