# Office / Excel / Google Sheets Tips

Various tips and notes mostly for online sheets in Google Workspace (formerly known a G-Suite) many of which might also work in Open Office, Microsoft Office, Next Cloud or Murena.

## URL text to clickable new column

Useful for non-clickable URLs after CSV import like from a GDPR-compliant data takeout from LinkedIn or Google: add another column with the same links clickable. This requires to leave all cells of the new column auto-generated. Overwriting a single one breaks the whole column. Also don't delete the original URL column, otherwise !REF error in derived column cells.

Adapt the columns in the formula to your sheets/table layout.

Paste this formula into cell T2 (the first empty cell below your header in column T):
```excel
=ARRAYFORMULA(IF(S2:S<>"", HYPERLINK(S2:S, S2:S), ""))
```

How this works:

- S2:S targets your entire URL column from row 2 all the way to the bottom.
- T2 is where the clickable links will instantly spill down. Make sure column T is completely empty before pasting.

