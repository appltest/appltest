FROM debian:stable

RUN apt-get update \
    && apt-get install -y \
      iputils-ping \
      openssh-server \
      openssh-client \
      curl \
      lsof \
      strace \
      htop \
      vim \
      iproute2 \
      tcpdump \
      procps \
      less \
      jq \
      netcat-openbsd \
      daemontools \
      ansible \
      gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ssh/authorized_keys /root/.ssh/authorized_keys
ADD service /etc/service/

#ENTRYPOINT service ssh restart && tail -f /dev/null
ENTRYPOINT /usr/bin/svscan /etc/service

