pihole-unbound
==============

This integrates the Unbound dns resolver with Pi-hole.

[![build](https://github.com/jeboehm/pihole-unbound/actions/workflows/test.yml/badge.svg)](https://github.com/jeboehm/pihole-unbound/actions/workflows/test.yml)

## Test

You can test DNSSEC validation using

```
dig sigfail.verteiltesysteme.net @piholeAddress
dig sigok.verteiltesysteme.net @piholeAddress
```

Replace ```piholeAddress``` with the actual ip address of your instance.

The first command should give a status report of SERVFAIL and no IP address. The second should give NOERROR plus an IP address.

## More Information

- [Unbound, Integration Guide](https://docs.pi-hole.net/guides/dns/unbound/)
- [Pi-Hole Environment Variables](https://github.com/pi-hole/docker-pi-hole#environment-variables)
