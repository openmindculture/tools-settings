# Fix Faux-Grid Firefox Height Issue

Overflow: hidden on the container does not cut the decoration but makes it disappear completely in firefox, and so does while min-height zero has no effect.

Wrapper: `display grid, grid-template-columns: 1fr; decoration: grid-row: 1;
  grid-column: 1; align-self:stretch;` fixes Firefox but breaks Webkit.

```css
@supports (-moz-appearance: none) {
 .shortlist-wrapper {
   display: grid;
   grid-template-columns: 1fr;
 }

 .shortlist-background {
   grid-row: 1;
   grid-column: 1;
   align-self: stretch;
 }
}
```