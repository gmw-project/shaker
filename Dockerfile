# Use Fedora latest
# credits to GitHub @najahiiii
FROM fedora:latest
LABEL maintainer "goodmeow(Harun) <harunbam3@gmail.com>"

# Indonesian timezone (GMT+7)	
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#llvm
RUN dnf install -y wget \
    && wget https://github.com/najahiiii/Noob-Script/raw/noob/setup/che-llvm.repo -P ~/ \
    && mv ~/che-llvm.repo /etc/yum.repos.d/ \
    && chown root:root /etc/yum.repos.d/che-llvm.repo \
    && wget https://github.com/najahiiii/Noob-Script/raw/noob/setup/lantw44-toolchains.repo -P ~/ \
    && mv ~/lantw44-toolchains.repo /etc/yum.repos.d/ \
    && chown root:root /etc/yum.repos.d/lantw44-toolchains.repo


RUN dnf install -y \
        aarch64-linux-gnu-{binutils,gcc,glibc} \
        arm-linux-gnueabi-{binutils,gcc,glibc} \
        bc \
        bison \
        clang \
        curl \
        diffutils \
        flex\
        git-core \
        gnupg1 \
        hostname \
        java-latest-openjdk-headless \
        libtool \
        llvm \
        lld \
        m4 \
        make \
        openssl-devel \
        python \
        shtool \
        which \
        zip \
        && dnf clean all

# Git
RUN git config --global user.email "harunbam3@gmail.com"
RUN git config --global user.name "goodmeow"

RUN git clone https://github.com/kdrag0n/proton-clang -b master --depth=1 --single-branch /root/proton-clang

CMD ["/bin/bash"]
