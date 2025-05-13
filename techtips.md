# Tech Tips and Dev Links

## Coding Custom Blocks in WordPress

Custom blocks need funktionally redundant code both in PHP (for rendering to the frontend) as well as in JavaScript (React component for the block editor).

Custom Blocks mit Custom Markup!!! PoC KO? weil Shortcode Block unreliable (how could it just suddenly stop working altogether, how can it be so easy to break, and why wouldn't Google or AI show easy fixes for common reasons?, has no preview (although I might have faked one with CSS ::after) and no descendants; block variations are limited, don't support custom markup and no arbitratry descendants! Tech TIL TODO mit PHP render damit cacheable static output.

## USB-Tethering using an Android Smartphone

USB-Tethering: just plug in (then it also charges the device battery, even if the laptop is unplugged), and then on the Android device, switch from (only) charging to USB tetehering, then the laptop should be online without further configuration change. Ensure the Android device doesn't share mobile instead of wi-fi when tethered USB. ok;

Check in Linux Mint using nm-widget (restart if crashed)

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

State Queries
https://chromestatus.com/feature/5072263730167808
- Whether a sticky positioned container is stuck to one of the edges of the scroll box (stuck)
- Whether a scroll snap aligned container is currently snapped horizontally or vertically (snapped)
- Whether a scroll container can be scrolled in a queried direction (scrollable)

https://developer.chrome.com/blog/css-text-box-trim

https://12daysofweb.dev/2024/calc-size-and-interpolate-size/

https://css-tricks.com/scroll-driven-animations-notebook/

more contemporary CSS
https://mailchi.mp/smashingmagazine/472-new-css-features-for-2025?e=376e82ff51
