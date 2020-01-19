# Pull the base image
FROM christopher102994/docker-base-img-gui:debian-10
MAINTAINER chris102994<chris102994@yahoo.com>
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/chris102994/docker-musicbrainzpicard"
ENV APP_NAME=MusicBrainzPicard

RUN echo "##### Downloading Runtime Packages #####" && \
		install \
			picard && \
	echo "#### Setup MusicBrainzPicard ####" && \
		mkdir -p \
			/config/data \
			/config/log  \
			/unsorted \
			/sorted && \
		chown -R 900:900 /unsorted && \
		chmod -R 0755 /unsorted && \
		chown -R 900:900 /sorted && \
		chmod -R 0755 /sorted && \
    echo "##### App Setup #####" && \
		sed -i 's#APP_NAME#MusicBrainzPicard#g' /etc/xdg/openbox/menu.xml && \
		sed -i 's#APP_ICON_LOC#/usr/share/icons/hicolor/16x16/apps/org.musicbrainz.Picard.png#g' /etc/xdg/openbox/menu.xml && \
		sed -i 's#APP_COMMAND#/usr/bin/picard -N >> /config/log/MusicBrainzPicard.log#g' /app/start_app.sh && \
		cp /usr/share/icons/hicolor/16x16/apps/org.musicbrainz.Picard.png /etc/noVNC/app/images/icons/novnc-16x16.png
#Work Dir
WORKDIR /music