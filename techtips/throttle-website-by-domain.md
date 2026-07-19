# Throttle Website Access based on Domain Name

Purpose: either for web performance testing, or to cause friction when users open websites or web apps that tend to fuel procrastination, like Instagram, Reddit, X, ChatGPT, or Gemini. You can configure your computer's native network layer to deliberately drop packets or delay traffic going to specific websites.

## On Linux & macOS (Using Packet Filter pfctl and dummynet)

Unix-based systems can use the Packet Filter (`pf`) tool to create a pipe that artificially restricts bandwidth to specific web domains.

Open your terminal.

Create a dummy network pipe with a strict speed limit (e.g., 50 Kilobits per second):

```bash
sudo dnctl pipe 1 config bw 50Kbit
```

Route traffic meant for the distracting website (e.g., reddit.com) through that slow pipe:

```bash
echo "dummynet out proto tcp to reddit.com pipe 1" | sudo pfctl -f -
```

Enable the firewall:
```bash
sudo pfctl -E
```