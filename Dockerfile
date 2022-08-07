FROM pihole/pihole:2022.07

RUN set -e && \ apt-get update && \
    apt-get install --no-install-recommends -y unbound unbound-anchor ssh && \
    rm -rf /var/lib/apt/lists/* && \
    curl -so /usr/bin/pihole-cloudsync https://raw.githubusercontent.com/stevejenkins/pihole-cloudsync/master/pihole-cloudsync && \
    chmod +x /usr/bin/pihole-cloudsync && \
    touch /etc/dnsmasq.d/05-pihole-custom-cname.conf

COPY rootfs/ /
RUN unbound-anchor -4 -a /var/lib/unbound/root.key -r /usr/share/dns/root.hints -vvv || echo "OK"

ENV PIHOLE_DNS_ 127.0.0.1#5335
ENV CLOUDSYNC_MODE off
ENV GIT_REPOSITORY ""
