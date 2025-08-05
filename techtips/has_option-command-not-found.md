# has_option command not found

- error in `~/.xsession-errors`
- fix in `/etc/X11/Xsession.d` or `/usr/sbin/lightdm-session`

## Notes, Sources, Further Reading

### Fix by Running an Existing has_option Function Correctly

> The function `has_option` should be found. It's in `/etc/X11/Xsession`.
> Additional information
> In `/usr/sbin/lightdm-session` at line 85+86 is this piece of code:
```
# Run all system xinitrc shell scripts.
xinitdir="/etc/X11/xinit/xinitrc.d"
```

However, this directory doesn't exsist. So I changed it to:

```
xinitdir="/etc/X11/xinit"
```

In there is `xinitrc` which runs `/etc/X11/Xsession`.
That fixed the error on my machine.

[https://github.com/canonical/lightdm/issues/410](https://github.com/canonical/lightdm/issues/410)

### Alternative Fix Adding the Missing has_option Function

> A local fix for these 3 bugs can be applied by executing long command below to re-add missing `has_option` function:

```
cat <<\EOF | sudo tee /etc/X11/Xsession.d/20x11-add-hasoption
# temporary fix for LP# 1922414, 1955135 and 1955136 bugs
# read OPTIONFILE
OPTIONS=$(cat "$OPTIONFILE") || true

has_option() {
if [ "${OPTIONS#*
$1}" != "$OPTIONS" ]; then
return 0
else
return 1
fi
}
EOF
```

> and then reboot. This will allow `ssh-agent` to start and other necessary fixes.
>
> Note: if you have any additional issues caused by adding above file - please feel free to remove it by `sudo rm /etc/X11/Xsession.d/20x11-add-hasoption` and inform me about this problem.

> Based on some additional searches that I've done, what seems to me to be the root cause of this issue has been discussed in the following Debian bug, reported about 2 years ago (in June 2020) by Jan Rauberg:
> #963059 - x11-common: false linebreak in 20x11-common_process-args function has_option - Debian Bug report logs
> [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=963059](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=963059)
> ... where Jan Rauberg wrote, among other things, the following,:
> "(...) * What led up to the situation?
> x2go session ignores .Xresource configuration.
> There is a false linebreak in function 'has_option' of 20x11-common_process-args.
> The lines

```
if [ "${OPTIONS#*
$1}" != "$OPTIONS" ]; then
```

should be

```
if [ "${OPTIONS#*$1}" != "$OPTIONS" ]; then
```

[https://ubuntu-mate.community/t/xsession-d-errors-how-to-fix-line-has-option-command-not-found/25673/2](https://ubuntu-mate.community/t/xsession-d-errors-how-to-fix-line-has-option-command-not-found/25673/2)