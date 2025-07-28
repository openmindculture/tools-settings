# black screen with movable mouse pointer after logging into my Xfce session in Linux Mint 22 Wilma

Solution: 
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