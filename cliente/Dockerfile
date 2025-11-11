FROM debian:12

RUN apt update  && apt install -y \
    procps \
    iproute2 \
    iputils-ping \
    bind9utils \
    dnsutils \
    isc-dhcp-client \
    && rm -rf /var/lib/apt/lists/*


CMD ["sleep", "infinity"]
