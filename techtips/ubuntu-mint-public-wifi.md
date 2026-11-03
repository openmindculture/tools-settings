# Connectivity in a Public WiFi Network

## Network Manager Widget/Applet

Use (or restart) network manager services widget:

- `nm-applet`
- `nm-widget`

## Wifi on ICE vs. Docker Conflict Prevention

As found out and fixed by Erik Donner the public "Wifi on ICE" internet network on German long-distance trains uses the same network address range as the default Docker network `docker0` used by many web developers on their local computer. As we can't change the Deutsche Bahn setup, we must modify our Docker default address pools settings. After changing, we should probably restart Docker and all active containers.

### Change Docker Network on Linux Mint or Ubuntu

- `docker stop $(docker ps -q)`
- `docker network rm $(docker network ls -q)` (and ignore warnings)

Verify all conflicting networks are gone. If you still see unhelpful outdated `docker0` networks using

- `ip route show`

then you can delete it:

- `sudo ip link set docker0 down`
- `sudo ip link delete docker0`

- `sudo vi /etc/docker/daemon.json`

Adapt the following example if necessary to prevent conflicting with other networks like a corporate intranet or VPN.

```json
{
  "default-address-pools": [
    {
      "base": "10.10.0.0/16",
      "size": 24
    }
  ]
}
```

Restart Docker:

- `sudo systemctl restart docker`

Recreate the network when `docker compose up` doesn't and complains about an "error response from daemon: failed to set up container networking: network not found", prune obsolete network requirements:

- `docker network prune -f`

and force recreation when restarting a container:

- `docker compose up --force-recreate`

Connect to the public wi-fi network.

You can tweak further network settings and increase timeout tolerance to facilitate reaching notorious points of failure like GitHub. Edit
`/etc/sysctl.conf`

```
# override default 60s timeout
net.ipv4.tcp_fin_timeout=180

# override default 5 passive ftp
net.ipv4.tcp_snyack_retries=8
```

## Trigger Sign-In Page

The first network connection to an unencrypted public page like http://captive.apple.com/ or
http://captive.open-mind-culture.org/ should trigger a public wifi sign-in page if it's not opened automatically.

Sources:
- [Creating a Captive Page to Sign into any Public Network](https://dev.to/ingosteinke/creating-a-captive-page-to-sign-into-any-public-network-19a4)
- [Cannot reach public WIFI login page in Ubuntu 18.04 Captive Portal Issue](https://askubuntu.com/questions/1046321/cannot-reach-public-wifi-login-page-in-ubuntu-18-04-captive-portal-issue)
- [Probleme mit dem WIFIonICE](https://forum.ubuntuusers.de/topic/probleme-mit-dem-wifionice/)
- [WLAN im ICE mit Linux und Docker, Erik Donner, 2026](https://www.erikdonner.dev/2024/11/01/wlan-im-ice-mit-linux-und-docker/)
- [Still no internet? How to prevent premature timeouts in Ubuntu? by Ingo Steinke, 2024, updated 2026](https://dev.to/ingosteinke/there-is-still-no-internet-how-to-prevent-premature-timeouts-on-ubuntu-5hdk)

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

