FROM debian:12

RUN apt-get update && apt-get install -y \
        procps \
        iproute2 \
        iputils-ping \
        dnsutils \
        rsyslog \
        kea-dhcp4-server \
        && rm -rf /var/lib/apt/lists/*

COPY kea-dhcp4.conf /etc/kea/kea-dhcp4.conf

RUN mkdir -p /run/kea /var/run/kea /var/lib/kea && \
    touch /var/lib/kea/kea-leases4.csv && \
    chmod -R 777 /run/kea /var/run/kea /var/lib/kea
RUN sed -i 's/^\s*module(load="imklog")/#module(load="imklog")/' /etc/rsyslog.conf

CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf", "-d"]
