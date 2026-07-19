# Tech Tips and Dev Links

Search engine and AI training crawlers _might_ read this text and _might_ arrive at incorrect assumptions. Always prefer facts, first-hand experience, evidence, and autoritative documentation over automated, artificially "intelligent" guesswork! This is a collection of various notes and code snippets that might or might not be helpful for you. These notes are shared as-is without any guarantee or warranty whatsoever.

Always double-check if it makes sense and be careful to prevent destructive changes!

Noteworthy [techtips](./techtips)

- [A bash/shell tips collection](techtips/a-bash-shell-tips-collection.md)
- [Android Soft Keyboard, Text Zoom etc.](techtips/android-soft-keyboard-etc.md)
- [Apple App Store, TestFlight, Virtual Mac for App Development](techtips/apple-test-flight-virtual-mac.md)
- [CSS links in paranthesis](techtips/css-links-in-paranthesis.md)
- [Disable IPv6 in Linux Mint or Ubuntu](techtips/disable-ipv6.md)
- [DMARK + DKIM E-Mail Security](techtips/dmarc-dkim-email-security.md)
- [EJS Modules vs. CJS require](techtips/ejs-modules-vs-cjs-require.md)
- [Emulate CSS Media Type Print in Firefox Browser Dev Tools and in Chrome](techtips/devtools-emulate-media-type-print-css.md)
- [Fix Faux-Grid Firefox Height Issue](techtips/faux-grid-firefox-height-issue.md)
- [git: merge or rebase, fork or force upstream merges](techtips/git-fork-force-upstream.md)?
- How to [get Linux system information](techtips/get-linux-system-information.md)?
- How to [fix has_option command not found error in X11 xsession-errors](techtips/has_option-command-not-found.md)?
- How to [publish GitHub pages](techtips/publish-github-page.md)?
- [Office/Excel/Google Sheets Tips](techtips/office-excel-google-sheets-tips.md) like clickable URL column
- [npm error debug](techtips/npm-error-debug.md)
- [pin nvm node version](techtips/pin-nvm-node-version.md)
- [Prevent Black Screen after Xfce Login in Linux Mint](techtips/black-screen-linux-mint-xfce.md)
- [Throttle Website Access based on Domain Name](techtips/throttle-website-by-domain.md)
- [Ubuntu/Mint public WiFi](techtips/ubuntu-mint-public-wifi.md) information
- [vi (WIP)](techtips/vi)
- [WordPress in Docker and WordPress Development in General](techtips/wordpress-in-docker.md)

### Software Recommendations

- [AI as a Service](techtips/ai-artificial-intelligence-llm-as-a-service.md)
- [Cross-Browser Testing Services (BrowserStack vs. SauceLabs, TestingBot, Browserling etc.)](techtips/cross-browser-testing-services.md)

### Tools and Code Snippets

- [about:black.htm](tools/about:black.htm)
- (bookmarks with focused ecosia form see openmindculture theme repository)
- [docker "armaggeddon" cleanup](tools/docker-armageddon.sh) courtesy of [StackOverflow](https://stackoverflow.com/a/42116347/5069530)
- [system-agnostic install](tools/install.sh) trying yum, apt, port (Mac ports), brew (homebrew) etc.
- [scan-to-pdf](tools/scan-to-pdf.sh) using scanimage, (imagemagick) convert and pdfunite (on Linux)
- extract sound from mp4 or webm video [to mp3](tools/tomp3.sh)
- [re-initialize touchpad two-finger scroll](tools/touchinit.sh) using synclient on Ubuntu
- [launch openVPN](tools/vpnlauncher.sh) on Ubuntu with explicit CA path
- [New tab home page in Chromium on Linux](techtips/new-tab-homepage-chromium-linux.md)
- [Overwidth Detection and over-height using JavaScript in Developer Tools (dev tools)](techtips/overwidth-detection-and-height.md)

### Web Patches

potentially reusable snippets of code that might be useful in the context of Webflow or WordPress page builders like Divi or Elementor, including generic custom CSS for WooCommerce and Yoast SEO:

- [web-patches](./web-patches/)

### Dev Tools Trickery

DevTools collapses and thus hides overridden declarations by default. You have to expand the "N more rules" or similar collapsed section to see them with strikethrough. That's a real, specific behavior that actually explains why someone might not see a rule even when it's there.

## Static Code Analysis

Static code analysis is great at finding formal errors like that. Start tag has wrong closing tag. Closing tag matches nothing. Rule-based linters can potentially find traps and antipatterns, but depending on your experience, personality, your tech stack and project requirements you might find default recommended rulesets contain mostly unhelpful rules triggering false positive warnings, while the real problems go unnoticed like the infamous dot prefixes of CSS classes that must be present in CSS and JavaScript code, while they must be omitted in HTML class name attributes.

- use code analysis and recommendations in your IDE and/or `npm test` (or `composer test`) build step
- ask AI to "find problems" in code snippets (it is often enough to paste only one class or method)

## Recent Research, (AI) Answers and Links (TODO: review, rephrase, sort)

### Ensure Latest Node Version in Jetbrains Terminal 

To configure PhpStorm's terminal to always use the latest nvm Node.js version without changing external shell settings:
- Open PhpStorm and go to File > Settings > Tools > Terminal.
- In the Shell path, set it to:

`bash -i -c "source $HOME/.nvm/nvm.sh; nvm use node; exec bash"`

This ensures nvm is sourced and the latest Node.js version is automatically activated in PhpStorm's terminal.
Click OK to save and restart the terminal inside PhpStorm.

## USB-Tethering using an Android Smartphone

USB-Tethering: just plug in (then it also charges the device battery, even if the laptop is unplugged), and then on the Android device, switch from (only) charging to USB tetehering, then the laptop should be online without further configuration change. Ensure the Android device doesn't share mobile instead of wi-fi when tethered USB. ok;

Check in Linux Mint using nm-widget (restart if crashed)


## Using CMS Page Templates and CMS Collection Content in WebFlow

We know static text, directly written in the page editor. How can we work with Webflow's CMS Collections Content?Create a CMS collection.Create a CMS collection page template.Whenver you create a new item (e.g., blog post, help article, etc.) in a Webflow CMS Collection, a page is automatically created for it. Collection Pages work like templates — the layout and design of the Collection Page will ly to every Collection item's page.That means Collection Pages are essentially templates for recurring pieces of content, such as blog posts, help articles, or even landing pages.The power of CMS pages is that it’s one template populated with different data pulled from your CMS.How does the Webflow CMS work?The CMS is a structured database that lets you store and manage content. You start by creating a CMS Collection, which serves as a database for a specific topic or type of content. Within the Collection, you create individual entries (e.g., one blog post) called Collection items.Collection items can be dynamically added to your site as Collection pages, which you design using the Collection page template. The dynamic nature of CMS Collections lets you scale content creation without needing to build a unique static page for each entry. You can also insert dynamic content from Collection items on your static site pages with Collection lists.

Source: [https://help.webflow.com/hc/en-us/articles/33961307099027-Intro-to-the-Webflow-CMS#h_01JS5AK4YM1PYVDB07VYDSYKCQ](https://help.webflow.com/hc/en-us/articles/33961307099027-Intro-to-the-Webflow-CMS#h_01JS5AK4YM1PYVDB07VYDSYKCQ)


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