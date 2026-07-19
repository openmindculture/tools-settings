# CSS Links in Paranthesis

Useful for print stylesheets: show links in paranthesis using pure CSS:

Links should also be written out in parentheses in media print view, can we do this with pure CSS in a website?

This is a classic CSS print trick using the ::after pseudo-element and the attr() function:

```css
@media print {
  a[href]::after {
    content: " (" attr(href) ")";
  }
}
```

This automatically appends the URL in parentheses after every link when printing. You can refine it further:

```css
@media print {
  /* Skip links that are just anchors or javascript */
  a[href]:not([href^="#"]):not([href^="javascript"])::after {
    content: " (" attr(href) ")";
  }
}
```