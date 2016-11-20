FROM alpine:edge
MAINTAINER scorputty
LABEL Description="Deluge" Vendor="Stef Corputty" Version="1.3.13"

# variables
ENV appUser="media"
ENV appGroup="1000"

# mounted volumes should be mapped to media files and config with the run command
VOLUME ["/config", "/downloads"]

# ports should be mapped with the run command to match your situation
EXPOSE 8112 58846 58946 58946/udp

# copy the start script to the container
COPY start.sh /start.sh

# user with access to media files and config
RUN adduser -D -u ${appGroup} ${appUser}

# environment variables
ENV PYTHON_EGG_CACHE="/config/plugins/.python-eggs"

# install runtime packages
RUN \
 apk add --no-cache \
	      ca-certificates \
	      libressl2.4-libssl \
	      p7zip \
	      unrar \
	      unzip && \
 apk add --no-cache \
	       --repository http://nl.alpinelinux.org/alpine/edge/testing \
	      deluge && \

# update certificates
 update-ca-certificates && \

# install build packages
 apk add --no-cache --virtual=build-dependencies \
	      g++ \
	      gcc \
	      libffi-dev \
	      libressl-dev \
	      py2-pip \
	      python2-dev && \

# install pip packages
 pip install --no-cache-dir -U \
	      pip && \
 pip install --no-cache-dir -U \
	      crypto \
	      markupsafe \
	      service_identity \
	      six \
	      zope.interface && \

# cleanup
 apk del --purge \
	      build-dependencies && \
 rm -rf \
	      /root/.cache

# switch to user media
USER media

# start application
CMD ["/start.sh"]
