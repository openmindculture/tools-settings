# Tech Tips and Dev Links

Search engine and AI training crawlers _might_ read this text and _might_ arrive at incorrect assumptions. Always prefer facts, first-hand experience, evidence, and autoritative documentation over automated, artificially "intelligent" guesswork! This is a collection of various notes and code snippets that might or might not be helpful for you. These notes are shared as-is without any guarantee or warranty whatsoever.

Always double-check if it makes sense and be careful to prevent destructive changes!

Noteworthy [techtips](./techtips)

- [Prevent Black Screen after Xfce Login in Linux Mint](techtips/black-screen-linux-mint-xfce.md)
- [Disable IPv6 in Linux Mint or Ubuntu](techtips/disable-ipv6.md)
- [EJS Modules vs. CJS require](techtips/ejs-modules-vs-cjs-require.md)
- How to make [git fork or force upstream merges](techtips/git-fork-force-upstream.md)?
- How to [get Linux system information](techtips/get-linux-system-information.md)?
- How to [fix has_option command not found error in X11 xsession-errors](techtips/has_option-command-not-found.md)?
- How to [publish GitHub pages](techtips/publish-github-page.md)?
- [npm error debug](techtips/npm-error-debug.md)
- [pin nvm node version](techtips/pin-nvm-node-version.md)
- [Ubuntu/Mint public WiFi](techtips/ubuntu-mint-public-wifi.md) information

### Tools and Code Snippets

- [about:black.htm](tools/about:black.htm)
- [docker "armaggeddon" cleanup](tools/docker-armageddon.sh) courtesy of [StackOverflow](https://stackoverflow.com/a/42116347/5069530)
- [system-agnostic install](tools/install.sh) trying yum, apt, port (Mac ports), brew (homebrew) etc.
- [scan-to-pdf](tools/scan-to-pdf.sh) using scanimage, (imagemagick) convert and pdfunite (on Linux)
- extract sound from mp4 or webm video [to mp3](tools/tomp3.sh)
- [re-initialize touchpad two-finger scroll](tools/touchinit.sh) using synclient on Ubuntu
- [launch openVPN](tools/vpnlauncher.sh) on Ubuntu with explicit CA path

### Web Patches

potentially reusable snippets of code that might be useful in the context of Webflow or WordPress page builders like Divi or Elementor, including generic custom CSS for WooCommerce and Yoast SEO.

## Static Code Analysis

Static code analysis is great at finding formal errors like that. Start tag has wrong closing tag. Closing tag matches nothing. Rule-based linters can potentially find traps and antipatterns, but depending on your experience, personality, your tech stack and project requirements you might find default recommended rulesets contain mostly unhelpful rules triggering false positive warnings, while the real problems go unnoticed like the infamous dot prefixes of CSS classes that must be present in CSS and JavaScript code, while they must be omitted in HTML class name attributes.

## Recent AI Answers and Links (TODO: review, rephrase, sort)

### Ensure Latest Node Version in Jetbrains Terminal 

To configure PhpStorm's terminal to always use the latest nvm Node.js version without changing external shell settings:
- Open PhpStorm and go to File > Settings > Tools > Terminal.
- In the Shell path, set it to:

`bash -i -c "source $HOME/.nvm/nvm.sh; nvm use node; exec bash"`

This ensures nvm is sourced and the latest Node.js version is automatically activated in PhpStorm's terminal.
Click OK to save and restart the terminal inside PhpStorm.

## Coding Custom Blocks in WordPress

Custom blocks need funktionally redundant code both in PHP (for rendering to the frontend) as well as in JavaScript (React component for the block editor).

Custom Blocks mit Custom Markup!!! PoC KO? weil Shortcode Block unreliable (how could it just suddenly stop working altogether, how can it be so easy to break, and why wouldn't Google or AI show easy fixes for common reasons?, has no preview (although I might have faked one with CSS ::after) and no descendants; block variations are limited, don't support custom markup and no arbitratry descendants! Tech TIL TODO mit PHP render damit cacheable static output.

## USB-Tethering using an Android Smartphone

USB-Tethering: just plug in (then it also charges the device battery, even if the laptop is unplugged), and then on the Android device, switch from (only) charging to USB tetehering, then the laptop should be online without further configuration change. Ensure the Android device doesn't share mobile instead of wi-fi when tethered USB. ok;

Check in Linux Mint using nm-widget (restart if crashed)


## Using CMS Page Templates and CMS Collection Content in WebFlow

We know static text, directly written in the page editor. How can we work with Webflow's CMS Collections Content?Create a CMS collection.Create a CMS collection page template.Whenver you create a new item (e.g., blog post, help article, etc.) in a Webflow CMS Collection, a page is automatically created for it. Collection Pages work like templates — the layout and design of the Collection Page will ly to every Collection item's page.That means Collection Pages are essentially templates for recurring pieces of content, such as blog posts, help articles, or even landing pages.The power of CMS pages is that it’s one template populated with different data pulled from your CMS.How does the Webflow CMS work?The CMS is a structured database that lets you store and manage content. You start by creating a CMS Collection, which serves as a database for a specific topic or type of content. Within the Collection, you create individual entries (e.g., one blog post) called Collection items.Collection items can be dynamically added to your site as Collection pages, which you design using the Collection page template. The dynamic nature of CMS Collections lets you scale content creation without needing to build a unique static page for each entry. You can also insert dynamic content from Collection items on your static site pages with Collection lists.

Source: [https://help.webflow.com/hc/en-us/articles/33961307099027-Intro-to-the-Webflow-CMS#h_01JS5AK4YM1PYVDB07VYDSYKCQ](https://help.webflow.com/hc/en-us/articles/33961307099027-Intro-to-the-Webflow-CMS#h_01JS5AK4YM1PYVDB07VYDSYKCQ)


## Show Debugging Output in the Browser in WordPress

Add the following code in `wp-config.php` (not in `functions.php`):

```
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true );
@ini_set( 'display_errors', 1 );
```

In a local docker setup:

`docker ps` shows the WordPress container ID like bef44f642c24. In most cases, you only need to type the first letters that distinguish it clearly from all other running containers.

Edit the config file in the container (not recommended):

```
docker exec -it bef44 bash
apt update && yes | apt install vim
vi wp-config.php
```

Then you can _simply_ use the _usual_ vi commands and modes like dd, shift+o, or Esc wq! to (over)write and quit (save and exit) or Esc q! to quit without saving.

That's not recommended as the editor might not persist beyond the current session, and it has been omitted from the official wordpress:latest Docker image by design to keep the image size small and increase security.

The recommended way to edit files is to mount your `wp-content` directory as a volume in `docker-compose.yaml`, and then edit the files from on the host machine in the preferred editor/IDE.

Printing debug information to the browser is not recommended for security reasons either, so the WP_DEBUG code should be removed when no longer needed. 

## Links

- WebAIM Contrast Checker
[https://webaim.org/resources/contrastchecker/](https://webaim.org/resources/contrastchecker/)

- [RTL-safe layouts with logical properties in CSS](https://dev.to/web_dev-usman/stop-fighting-rtl-layouts-use-css-logical-properties-for-better-design-5g3m)

## New CSS Features

[https://www.smashingmagazine.com/2024/12/new-front-end-features-for-designers-in-2025/](https://www.smashingmagazine.com/2024/12/new-front-end-features-for-designers-in-2025/)

anchor-positioning
auto field-sizing
container queries
<dialog>
exclusive accordions
:focus-visible
:has
hidden=until-found
high-definition colors
<hr> in select
inputmode
min(), max(), clamp()
relative colors
responsive videos
scroll behavior
scroll snap
text-wrap: balance
:user-valid and :user-invalid
View Transitions API

When dealing with large blocks of text, such as paragraphs, you might want to look into text-wrap: pretty to prevent orphans on the last line.

## CSS State Queries

[https://chromestatus.com/feature/5072263730167808](https://chromestatus.com/feature/5072263730167808)

- Whether a sticky positioned container is stuck to one of the edges of the scroll box (stuck)
- Whether a scroll snap aligned container is currently snapped horizontally or vertically (snapped)
- Whether a scroll container can be scrolled in a queried direction (scrollable)

- [https://developer.chrome.com/blog/css-text-box-trim](https://developer.chrome.com/blog/css-text-box-trim)

- [https://12daysofweb.dev/2024/calc-size-and-interpolate-size/](https://12daysofweb.dev/2024/calc-size-and-interpolate-size/)

- [https://css-tricks.com/scroll-driven-animations-notebook/](https://css-tricks.com/scroll-driven-animations-notebook/)

more contemporary CSS
- [https://mailchi.mp/smashingmagazine/472-new-css-features-for-2025?e=376e82ff51](https://mailchi.mp/smashingmagazine/472-new-css-features-for-2025?e=376e82ff51)

Git status: nothing to commit, working tree clean.
Your branch is ahead of 'origin/main' by 2 commits.
Use "git push" to publish your local commits.

## Edit PDF metadata using exiftool
exiftool -Title="New Title" -Author="New Author" -Subject="New Subject" -Keywords="PDF, Metadata" example.pdf

## prevent git merge "conflicts"

- avoid large changes
- avoid (interactive) rebase, especially over large histories
- check files for common patterns
  - often, two different, completely unrelated blocks have been added at the same spot, causing an alleged conflict, as git is unsure which insertion to put first, so you decide!
  - often, a typo has been fixed or a version number upgraded which is mostly obvious to the human eye, especially an increased number
- brute-force paste the latest version if you don't really care for the history, e.g. when doing a squash / cleanup rebase to remove irrelevant or critical information from the history
- start a new repository if the old one is too messy and unrelated from what you're currently doing 