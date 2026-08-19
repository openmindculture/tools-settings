# Touchpad Support on Linux (WIP)

How to ensure that two-finger touch as right-click equivalent and vertical scrolling with two fingers equivalent to mouse wheel movement work on a Linux laptop? 

## Linux Mint on Thinkpad Laptop

- see [../tools/touchinit.sh](../tools/touchinit.sh):
   - `synclient VertTwoFingerScroll=1`

## Linux Mint on Tuxedo Infinitybook 5

The Infinitybook Linux Laptops come with touchpad support enabled by default in the preinstalled Ubuntu Budgie setup.
After switching to Linux Mint, we might need to reenable two-finger touch and other advanced gestures explicitly.

### Erratic Context Touch Failure

Vertical scrolling always works. Two-finger touch as context-menu-click works when a mouse is connected but erratically fails when it isn't,
or is there a more plausible explanation and what is the fix apart from using the context-menu-key?

#### Debugging

Check logs for touchpad errors:

```bash
journalctl -xe | grep -i touchpad
```

Using synclient as a fallback for older Synaptics drivers, see Thinkpad code above, is unlikely for modern laptops.