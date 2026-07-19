# VSCode vs. JetBrains IDEA

Visual Studio Code (Codium) vs. Jetbrains IDEA IDE editors (like PhpStorm) have many similarities but some keystrokes and key concepts differ.

## Find and Replace in VSCode

Shift + Alt + F find in folder in VS Code
sets like `./themes/foo`
into the search field "files to include"

## Code Formatting

What is the VS Code equivalent of Ctrl + Alt + L code formatting?

On Windows Shift + Alt + F
On Mac Shift + Option + F
On Linux Ctrl + Shift + I

Alternatively, you can find the shortcut, as well as other shortcuts, through the submenu View / Command Palette, also provided in the editor with Ctrl + Shift + P (or Command + Shift + P on Mac), and then searching for format document.

If there is no PHP formatter installed then it opens the extensions menu category:formatters php with many options, For a developer coming from PhpStorm, the best option might be PHP Intelephense.

### Control Code Formatting (per File and after Paste) in VSCode

Can I use editorconfig to prevent, per project, VS Code to change file formatting like indentation on save?

`"editor.formatOnSave": false`, not in global VS code settings, but in a project-specific configuration file only. Don't change `formatOnSave` in this project, but possibly do it in any other project.

Put it in `.vscode/settings.json` at your project root — that's exactly the per-project config file VS Code uses:

```json
{
  "editor.formatOnSave": false
}
```

Don't include in `/themes/foo` but prefer top level parent project like `wp-foo-bar`

### VS Code: How to restrict formatOnPaste to pasted content only?

tbd.

### Auto-Complete File Path in VSCode

Tip: there are situations when you know that you should get a popup with a snippet/autocomplete, but nothing appears in the editor. In that case you can use ctrl + space to open the suggestions list. 

Visual code by itself has no Path intellisense, but you can use this plugin.

press f1 and copy this in it: ext install path-intellisense

Its a plug-in made by Christian Kohler, all props to him.

Plus, as Searene mentions in the comments, you may also want to set "path-intellisense.absolutePathToWorkspace": false in User Settings to make the auto-completion of absolute paths work.

https://stackoverflow.com/questions/32658717/file-path-autocomplete-in-vs-code