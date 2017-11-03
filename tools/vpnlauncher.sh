#!/bin/sh

# openVPN launcher for Ubuntu with explicit CA path
sudo openvpn --script-security 2 --config /etc/openvpn/config/default.ovpn --ca /etc/openvpn/config/cacert.pem