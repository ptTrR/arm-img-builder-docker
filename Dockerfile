FROM ubuntu:20.04

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list


RUN   apt-get update \
    && apt-get install  -y --no-install-recommends \
        ca-certificates \
        apt-transport-https \
        binfmt-support \
        qemu \
        qemu-user-static \
        qemu-system-x86 \
        dosfstools \
        rsync \
        wget \
        lsof \
        build-essential \
        bison \
        xz-utils \
        dirmngr \
        parted \
        systemd \
        systemd-sysv \
        debootstrap \
        kmod \
        dbus \
        udev \
        procps \
        nano \
        unzip \
        git \
        bc \
        sudo \
        dialog \
        patch \
        unzip \
        rsync \
        cpio \
        flex \
        libssl-dev \
        libncurses5-dev \
        fakeroot \
        swig \
        aria2 \
        pv \
        toilet \
        figlet \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        gcc-arm-none-eabi \
        distro-info-data \
        lsb-release \
        python \
        python-dev \
        python3-distutils \
        python3-dev \
        lz4 \
        lzop \
        libfdt-dev \
        device-tree-compiler \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN     cd /lib/systemd/system/sysinit.target.wants/ \
        && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

RUN     rm -f /lib/systemd/system/multi-user.target.wants/* \
        /etc/systemd/system/*.wants/* \
        /lib/systemd/system/local-fs.target.wants/* \
        /lib/systemd/system/sockets.target.wants/*udev* \
        /lib/systemd/system/sockets.target.wants/*initctl* \
        /lib/systemd/system/basic.target.wants/* \
        /lib/systemd/system/anaconda.target.wants/* \
        /lib/systemd/system/plymouth* \
        /lib/systemd/system/systemd-update-utmp*

WORKDIR /build

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
