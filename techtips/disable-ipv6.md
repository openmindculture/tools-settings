# Force IPv4 Connection to prevent ELSTER Tax Web App Login Failure

To prevent ELSTER tax app rejection, we can force IPv4 connections by disabling IPv6 connections by adding the following line to the `/etc/sysctl.conf` configuration file:

```sh
# force IPv4 to prevent ELSTER tax app rejection
net.ipv6.conf.all.disable_ipv6 = 1
```