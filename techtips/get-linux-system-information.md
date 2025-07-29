# Get Linux System Information

- `lsb_release -a && uname -a && inxi && sudo lshw -C display && echo $XDG_SESSION_TYPE && xfwm4 --version`

## Linux Distribution Details

- `lsb_release -a`

## Linux Kernel Details

- `uname -a`

## Linux Configuration Details 

- `inxi`

inxi is a full-featured command line system information tool that displays details about hardware, device drivers, and system components on Linux and other operating systems.

## List Hardware Details

- `sudo lshw`
 
lshw (list hardware) is a command-line utility in Linux that provides detailed information about your system's hardware configuration like CPU model and speed, memory size, memory type, motherboard, BIOS, storage devices, network interfaces, display adapters etc.

## Detect XDG Session Type (X vs. Wayland)

- `echo $XDG_SESSION_TYPE`

## Xfce / Xfwm version and Details (when using Xfce)

- `xfwm4 --version`

## Further information

Use vendor-specific GUI tools like Tuxedo control center to see additional system and software information.