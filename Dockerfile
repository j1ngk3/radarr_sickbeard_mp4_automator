# Version 1.2
FROM linuxserver/radarr

RUN apk add --no-cache \
        ffmpeg \
        git \
        py3-pip \
        openssl \
        python3-dev \
        libffi-dev \
        openssl-dev \
        libxml2-dev \
        libxslt-dev \
        musl-dev \
        g++ \
        gcc \
        file \
        zlib-dev 

RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator/ && \  
    touch /sickbeard_mp4_automator/info.log && \ 
    chmod a+rwx -R /sickbeard_mp4_automator

RUN pip3 install --upgrade pip

RUN pip3 install -r /sickbeard_mp4_automator/setup/requirements.txt && \
    pip3 install -r /sickbeard_mp4_automator/setup/requirements-deluge.txt && \
    pip3 install -r /sickbeard_mp4_automator/setup/requirements-qbittorrent.txt