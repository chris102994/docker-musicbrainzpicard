## [chris102994/docker-musicbrainzpicard](https://github.com/chris102994/docker-musicbrainzpicard)

[![https://www.musicbrainzpicard.org/](https://picard.musicbrainz.org/static/img/picard-icon-large.svg)](https://www.picard.musicbrainz.org/)

[![Build Status](https://travis-ci.com/chris102994/docker-musicbrainzpicard.svg?branch=master)](https://travis-ci.com/chris102994/docker-musicbrainzpicard)
 [![Image Size](https://img.shields.io/microbadger/image-size/christopher102994/docker-musicbrainzpicard/debian-10)](https://hub.docker.com/repository/docker/christopher102994/docker-musicbrainzpicard)
 [![Image Layers](https://img.shields.io/microbadger/layers/christopher102994/docker-musicbrainzpicard/debian-10)](https://hub.docker.com/repository/docker/christopher102994/docker-musicbrainzpicard)
 [![Image Pulls](https://img.shields.io/docker/pulls/christopher102994/docker-musicbrainzpicard)](https://hub.docker.com/repository/docker/christopher102994/docker-musicbrainzpicard)

## Outside Packages
* Built on my [Base GUI Image](https://github.com/chris102994/docker-base-image-gui)
  * [Music Brainz Picard](https://www.picard.musicbrainz.org/) is a free and open-source software application for identifying, tagging, and organising digital audio recordings.

## Docker
```
docker run \
	--name=docker-musicbrainzpicard \
	-p 5700:5700 \
	-v </path/to/appdata/config>:/config \
  	-v </path/to/music>:/music \
	--restart unless-stopped \
	christopher102994/docker-musicbrainzpicard:debian-10
```

## Parameters
Container specific parameters passed at runtime. The format is `<external>:<internal>` (e.g. `-p 443:22` maps the container's port 22 to the host's port 443).

| Parameter | Function |
| -------- | -------- |
| -p 5700 | The web encrypted UI port. |
| -v /config | The directory where the application will store configuration information. |
| -v /music | The path to your music. |

## Application Setup

The admin interface is available at `http://<ip>:<port>/`

Access the mounted files within the web interface at `/music`.
