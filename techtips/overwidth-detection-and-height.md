# Overwidth Detection and over-height using JavaScript in Developer Tools (dev tools)

Similar to the overwidth detection script for dev tools console, how can I find the root culprit that is making a dom element too high?

```js
(function traceOverheight(selector) { let el = document.querySelector(selector); if (!el) return console.error('Element not found:', selector); console.group(`🔎 Height trace for: ${selector}`); while (el) { const rect = el.getBoundingClientRect(); const style = getComputedStyle(el); console.log( `%c${el.tagName.toLowerCase()}${el.id ? '#'+el.id : ''}`, 'font-weight:bold', `| h: ${Math.round(rect.height)}px`, `| computed: ${style.height}`, `| min-h: ${style.minHeight}`, `| padding: ${style.paddingTop}/${style.paddingBottom}`, `| overflow: ${style.overflow}`, el ); el = el.parentElement; } console.groupEnd(); })('.your-selector-here'); // 👈 change this
```

Change this "your-selector-here" to the element to inspect.