# Black Screen with Movable Mouse Pointer after Logging into my Xfce Session in Linux Mint 22 Wilma

## Reboot/Retry

Sometimes this issue is only erratically reproducible, and you might be lucky to get a working session at least.

## Remove obsolete Intel Video Drivers

Xfce forum admin [suggested to remove the driver package.](https://forum.xfce.org/viewtopic.php?pid=80354#p80354) 
> The kernel has built-in intel driver support that is more recent than the actual driver package and better supports newer intel graphics chips.

- `sudo apt remove xserver-xorg-video-intel package && sudo reboot`

If the drivers are not obsolete, revert/reinstall using `sudo apt install xserver-xorg-video-intel`.

## Disable Screensaver and Update Software
- switch to a non-graphical console using Ctrl+Alt+F1, 
- if there is no cursor, try typing any key to make a prompt appear, and 
- log in, 
- remove the blackbox screensaver and update kernel and software:

```sh
sudo apt remove blackbox
sudo apt update
sudo apt upgrade
```

After a successful upgrade, use Ctrl+Alt+F7 to switch back to the graphical desktop session.

So far, so good. Problem solved, next startup without problems.
However, the next day, the problem occurred again.
I retried the same solution/workaround, but still only a black screen with movable mouse pointer after Ctrl+Alt+F7.

## Start X session explicitly in a console session:

- switch to text console using Ctrl+Alt+F1,
- as there was no cursor, type any key,
- log in at the login prompt,
- ensure software is up to date: `sudo apt update && sudo apt upgrade`
- explicitly start the graphical system: `startx` or `startxfce4`
- switch back to the graphical desktop session using Ctrl+Alt+F7
- type or click anywhere and wait for the desktop session to initialize.

This is generally not a good idea.

Killing running `startx`, `startxfce` or `lightdm` processes isn't either.

Cons:
- two conflicting X sessions
- respawning apps with no additional debug information

## BIOS/Kernel Fixes

- update UEFI BIOS
- upgrade kernel
- downgrade kernel
- switch to default kernel
- switch to vendor-provided kernel (e.g. 6.11.0-120029-tuxedo #29~24.04.1tux2)

## find and fix potential configuration errors or incompatibilities

- see `~/.xsession-errors`
  - delete or rename existing error file to remove irrelevant noise
  - reproduce the error
  - check the file again: `tail ~/.xsession-errors`

- [has_option commannd not found](has_option-command-not-found.md)

## Further information

### How to get Linux System Information
- [get linux system information](./get-linux-system-information)

### Black Screen (Xfce) Issues in Linux (Mint)
- [Black screen after login Kernel issue [SOLVED]](https://forums.linuxmint.com/viewtopic.php?t=405349)
- [Black screen with mouse pointer after Xfce Login in Mint 22 wilma Tuxedo Infinitybook S15 Gen6](https://forums.linuxmint.com/viewtopic.php?t=450484) (Linux Mint forum)
- [Black screen with mouse pointer after Xfce Login in Mint 22 wilma Tuxe](https://forum.xfce.org/viewtopic.php?pid=80354) (Xfce forum)
