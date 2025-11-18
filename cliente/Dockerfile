FROM debian:12

RUN apt update  && apt install -y \
    iputils-ping \
    procps \
    iproute2 \
    iputils-ping \
    bind9utils \
    dnsutils \
    isc-dhcp-client \
    && rm -rf /var/lib/apt/lists/*

CMD ["sleep", "infinity"]

# COPY ./entrypoint.sh /tmp/entrypoint.sh
# RUN chmod +x /tmp/entrypoint.sh

# ENTRYPOINT [ "/tmp/entrypoint.sh" ]

