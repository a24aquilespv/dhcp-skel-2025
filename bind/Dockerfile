FROM debian:13

RUN apt update  && apt install -y \
    procps \
    iproute2 \
    iputils-ping \
    bind9 \
    bind9utils \
    dnsutils \
    nano \
    vim \
    neovim \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 53
WORKDIR /etc/bind

RUN mkdir -p /dns
COPY entrypoint.sh /dns
RUN chmod a+x /dns/entrypoint.sh

ENTRYPOINT [ "/dns/entrypoint.sh" ]