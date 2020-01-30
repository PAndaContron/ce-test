FROM gitpod/workspace-full-vnc

USER root

RUN sh -c "echo 'deb http://download.opensuse.org/repositories/home:/adriweb:/CEmu/xUbuntu_19.04/ /' > /etc/apt/sources.list.d/home:adriweb:CEmu.list" \
    && wget -nv https://download.opensuse.org/repositories/home:adriweb:CEmu/xUbuntu_19.04/Release.key -O - | apt-key add -

RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key -O - | apt-key add - \
    && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main' \
    && add-apt-repository ppa:cybermax-dexter/sdl2-backport

RUN apt-get update
RUN apt-get install -y cemu winehq-devel

RUN wget https://github.com/CE-Programming/toolchain/releases/download/v8.8/linux_CEdev.tar.gz -O - | tar zxvf - -C /

