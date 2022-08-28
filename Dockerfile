FROM pihole/pihole:2022.07

RUN set -e && apt-get update && \
    apt-get install --no-install-recommends -y unbound unbound-anchor && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /
RUN unbound-anchor -4 -a /var/lib/unbound/root.key -r /usr/share/dns/root.hints -vvv || echo "OK"

ENV PIHOLE_DNS_ 127.0.0.1#5335
