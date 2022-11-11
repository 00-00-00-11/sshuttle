#! /usr/bin/env sh

iptables -t nat -D OUTPUT 1
iptables -t nat -D PREROUTING 1
iptables -t nat -F sshuttle-12300
iptables -t nat -X sshuttle-12300