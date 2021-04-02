FROM ubuntu:20.04

WORKDIR /root/
RUN apt-get -qq update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get -qq install -y tzdata aria2 git python3 python2 rclone openjdk-8-jre cpio ccache \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

# Setup Git configs
RUN git config --global user.name "CI"
RUN git config --global user.email "ci@ci.com"

# Download repo tool
RUN mkdir ~/.bin && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && chmod a+x ~/.bin/repo
RUN echo PATH=~/.bin:$PATH >> ~/.bashrc
