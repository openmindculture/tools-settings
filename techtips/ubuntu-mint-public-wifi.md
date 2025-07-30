# Connectivity in a Public WiFi Network

## Network Manager Widget/Applet

Use (or restart) network manager services widget:

- `nm-applet`
- `nm-widget`

## Trigger Sign-In Page

The first network connection to an unencrypted public page like http://captive.apple.com/ or
http://captive.open-mind-culture.org/ should trigger a public wifi sign-in page if it's not opened automatically.

Sources:
- [Creating a Captive Page to Sign into any Public Network](https://dev.to/ingosteinke/creating-a-captive-page-to-sign-into-any-public-network-19a4)
- [Cannot reach public WIFI login page in Ubuntu 18.04 Captive Portal Issue](https://askubuntu.com/questions/1046321/cannot-reach-public-wifi-login-page-in-ubuntu-18-04-captive-portal-issue)
- [Probleme mit dem WIFIonICE](https://forum.ubuntuusers.de/topic/probleme-mit-dem-wifionice/)

## USB Tethering

USB-Tethering: einfach einstöpseln (lädt dann auch, selbst wenn Laptop nicht am Strom) und auf Android von (nur) aufladen auf USB-Tetehering umstellen, dann ist das Laptop (ohne weitere Notification oder Konfiguration) online.

Ensure it doesn't share mobile instead of wifi when tethered USB ok;

## Prevent Premature Timeouts in Ubuntu

Pages like GitHub are notorious for timing out too quickly, which can make it hard or impossible to work while travelling on a train or in a rural area.

> "not no internet" still does not guarantee any usable connection. 

### Increasing Ubuntu/Mint Linux Network Timeouts and Retries

Checking various sources, I learned that Ubuntu Linux networking did have some special problems, most of which seemed to have disappeared after an upgrade to the latest release at the time of writing. Those posts are usually five to ten years old. But one option still works in Ubuntu 22.04 in 2024: increasing the network timeouts and retries.

We can change the settings ad hoc using the sysctl interface. Tweaking net.ipv4 requires root privileges on my system, so I tried

- `sudo sysctl net.ipv4.tcp_fin_timeout=180` # to increase the timeout to 3 minutes (3x the default 60 seconds)
- `sudo sysctl net.ipv4.tcp_synack_retries=8` # to increase passive FTP retries above the default 5 times

 To persist these settings, I add the corresponding lines to my `/etc/sysctl.conf` configuration file:

```sh
# override default 60s timeout:
net.ipv4.tcp_fin_timeout=180

# override default 5 passive ftp retries
net.ipv4.tcp_synack_retries=8
```

Source: [Still no internet? How to prevent premature timeouts in Ubuntu?](https://dev.to/ingosteinke/there-is-still-no-internet-how-to-prevent-premature-timeouts-on-ubuntu-5hdk)

