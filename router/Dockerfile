FROM debian:13


RUN apt update && apt install -y \
    iproute2 \
    procps \
    nftables \
    dhcp-helper \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir /router
COPY ./entrypoint.sh /router/entrypoint.sh
RUN chmod +x /router/entrypoint.sh


# Forwardeo de paquetes entre interfaces
ENTRYPOINT [ "./router/entrypoint.sh" ]