[![Build Status](https://travis-ci.org/scorputty/deluge.svg?branch=master)](https://travis-ci.org/scorputty/deluge)
[![](https://images.microbadger.com/badges/image/cryptout/deluge.svg)](https://microbadger.com/images/cryptout/deluge "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cryptout/deluge.svg)](https://microbadger.com/images/cryptout/deluge "Get your own version badge on microbadger.com")

# Docker Deluge (Alpine Base)

This is a Dockerfile to set up "Deluge" - (http://deluge-torrent.org/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/deluge/).
If you don't want to customize the container you can run it directly by typing the following commands.
```sh
export VOL_CONFIG="/Volumes/shares/docker/config/deluge"
export VOL_DOWNLOADS="/Volumes/shares/docker/data/deluge/downloads"
export LOCAL_PORT1="8112"

docker run -d -h $(hostname) \
  -v ${VOL_CONFIG}:/config \
  -v ${VOL_DOWNLOADS}:/downloads \
  -v ${VOL_INCOMPLETE_DOWNLOADS}:/incomplete-downloads \
  -p ${LOCAL_PORT1}:8112 \
  -p 58846:58846 \
  -p 58946:58946 \
  -v ${VOL_DOWNLOADS}:/downloads \
  -v ${VOL_CONFIG}:/config \
  -e TZ=Europe/Amsterdam \
  -e PUID=1000 \
  -e PGID=1000 \
  --name=deluge --restart=always cryptout/deluge
```

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/deluge.git
cd deluge
./build.sh
```

### Variables
Change to match your situation.
```Dockerfile
ENV appUser="media"
ENV appGroup="1000"
```

### Volumes
Make sure to map the Volumes to match your situation.
```Dockerfile
VOLUME ["/config", "/downloads"]
```

### To run the container
Edit rundocker.sh (this will be replaced by docker-compose soon...).
```sh
./rundocker.sh
```

### WebGUI
To reach the WebGUI go to - (http://localhost:8112).
Or replace localhost with your target IP. Login with admin/deluge.

## Info
* Shell access whilst the container is running: `docker exec -it deluge /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f deluge`

# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
