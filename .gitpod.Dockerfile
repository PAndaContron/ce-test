FROM gitpod/workspace-full-vnc

USER root

RUN sh -c "echo 'deb http://download.opensuse.org/repositories/home:/adriweb:/CEmu/xUbuntu_19.04/ /' > /etc/apt/sources.list.d/home:adriweb:CEmu.list" \
    && wget -nv https://download.opensuse.org/repositories/home:adriweb:CEmu/xUbuntu_19.04/Release.key -O - | apt-key add -

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get install -y cemu wine wine32

RUN wget https://github.com/CE-Programming/toolchain/releases/download/v8.8/linux_CEdev.tar.gz -O - | tar zxvf - -C /
RUN mkdir /CEdev/CEmu
RUN wget https://tiroms.weebly.com/uploads/1/1/0/5/110560031/ti-84ce.rom -O /CEdev/CEmu/ti-84ce.rom
RUN chown -R gitpod:gitpod /CEdev

USER gitpod
ENV CEDEV=/CEdev
ENV PATH="${CEDEV}/bin:${PATH}"
USER root
