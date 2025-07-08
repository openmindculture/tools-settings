# Tech Tips and Dev Links

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

Source: https://help.webflow.com/hc/en-us/articles/33961307099027-Intro-to-the-Webflow-CMS#h_01JS5AK4YM1PYVDB07VYDSYKCQ


## Show Debugging Output in the Browser in WordPress

```
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true );
@ini_set( 'display_errors', 1 );
```

## Links

- WebAIM Contrast Checker
https://webaim.org/resources/contrastchecker/

- RTL-safe layouts with logical properties in CSS https://dev.to/web_dev-usman/stop-fighting-rtl-layouts-use-css-logical-properties-for-better-design-5g3m

## New CSS Features

https://www.smashingmagazine.com/2024/12/new-front-end-features-for-designers-in-2025/

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
https://chromestatus.com/feature/5072263730167808
- Whether a sticky positioned container is stuck to one of the edges of the scroll box (stuck)
- Whether a scroll snap aligned container is currently snapped horizontally or vertically (snapped)
- Whether a scroll container can be scrolled in a queried direction (scrollable)

https://developer.chrome.com/blog/css-text-box-trim

https://12daysofweb.dev/2024/calc-size-and-interpolate-size/

https://css-tricks.com/scroll-driven-animations-notebook/

more contemporary CSS
https://mailchi.mp/smashingmagazine/472-new-css-features-for-2025?e=376e82ff51

Git status: nothing to commit, working tree clean.
Your branch is ahead of 'origin/main' by 2 commits.
Use "git push" to publish your local commits.

## Edit PDF metadata using exiftool
exiftool -Title="New Title" -Author="New Author" -Subject="New Subject" -Keywords="PDF, Metadata" example.pdf
