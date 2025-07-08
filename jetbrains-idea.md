# Jetbrains IDEA, WebStorm, PhpStorm, Jetbrains AI related tips

TODO paste from research and AI answers

- best practice to work with code in IDEA editors
- using context actions and Jetbrains AI
- how to improve Jetbrains IDE window layout for terminal output and AI answers to prevent losing focus when too much text scrolls too fast in a too small tab or window?

- TODO

## Ensure Correct Indentation and Code Completion

To prevent incorrect indentation when pasting YAML code into an existing YAML file in PhpStorm, ensuring proper paste handling when pasting code, use Paste Simple (Ctrl + Shift + Alt + V) to paste the code exactly as it is without reformatting. If it reformats due to configured settings, manually trigger formatting with Ctrl + Alt + L after adjusting indentation levels. Before pasting, place the cursor where the pasted code should align, and it will inherit the proper indent level based on the current line.

## Integrated Terminal vs. External Shell

The built-in terminal had no real advantage for me. Disadvantages: complicated configuration, keeps using wrong node version, takes up IDE screen space, no AI integrations as JetBrains AI still can't read command output even if it's in the integrated IDE terminal.

## Leveraging JetBrains IDEA Advantages over VSCode

Grundlegende Überlegung:

Do JetBrains IDEs like WebStorm or PhpStorm still have significant advantage over VSCode-based alternatives like VSCode, Cursor, Codium in 2025? If so, how to leverage those advantages without getting overwhelmed by the numerous menu entries and keyboard shortcuts?

Gemeni
How to Leverage Advantages Without Getting Overwhelmed:
The "overwhelmed by menus and shortcuts" is a common and valid concern. JetBrains IDEs are indeed feature-rich. Here's how to tackle it:

Start with the Basics, Discover Incrementally:

Focus on Core Editing and Navigation: Initially, just use it as an advanced text editor. Get comfortable with basic typing, saving, and opening files.

Learn Essential Navigation Shortcuts: These are your productivity bedrock. Prioritize:

Ctrl+E (Recent Files)

Shift+Shift (Search Everywhere - most powerful shortcut)

Ctrl+B (Go to Declaration/Usage)

Ctrl+Alt+L (Reformat Code)

Ctrl+Space (Basic Code Completion)

Alt+Enter (Show Context Actions/Quick Fixes - invaluable!)

The "Find Action" Shortcut (Ctrl+Shift+A or Cmd+Shift+A): This is your best friend. Instead of hunting through menus, press Ctrl+Shift+A and type what you want to do (e.g., "refactor rename", "open terminal", "settings"). It will show you the action and its shortcut. Use it constantly!

Utilize Built-in Learning Tools:

"Learn IDE Features" (Help Menu): JetBrains IDEs often include an interactive "Feature Trainer" or "Learn IDE Features" accessible from the Help menu or the Welcome screen's "Learn" tab. These guided tutorials walk you through essential functionalities directly within the IDE.

Productivity Guide (Help Menu): Go to Help > Productivity Guide. This fantastic feature shows you how many times you've used various features and suggests others you might find useful. It's a great way to discover hidden gems.

Customize Your Workspace Gradually:

Hide Unused Tool Windows: By default, many tool windows might be open. Close the ones you don't use regularly (View > Tool Windows or right-click on the tool window header). You can always reopen them with their keyboard shortcuts (Alt+1 for Project, Alt+7 for Structure, Alt+F12 for Terminal, etc.).

Simplify the UI: PhpStorm/WebStorm have options to hide the Navigation Bar (View > Appearance > Navigation Bar) and Editor Tabs (Settings/Preferences | Editor | General | Editor Tabs). While radical, some users find a tabless workflow with Ctrl+E (Recent Files) less overwhelming.

Disable Unnecessary Plugins: Go to Settings/Preferences | Plugins. Disable any plugins that are installed by default but you don't use (e.g., specific language support for languages you don't touch, framework integrations you don't use). This can also improve performance.

Embrace the "Alt+Enter" (The Smart Fixer):

This is the magical shortcut. Whenever you see a highlighted piece of code (error, warning, suggestion), put your cursor on it and press Alt+Enter. It will offer context-sensitive actions, quick fixes, and refactorings. Learning to rely on Alt+Enter is key to unlocking the IDE's intelligence.

Watch Official Tutorials and Webinars:

JetBrains has an excellent YouTube channel with short, focused tutorials on specific features. Watching these (even without memorizing everything) can give you ideas of what's possible.

Their blog often features "Tip of the Day" or "Productivity Tips" articles.

Don't Force It All at Once:

Treat learning the IDE as an ongoing process. Each week, try to learn one new shortcut or explore one new feature. Over time, these small additions will compound into significant productivity gains.

In essence, JetBrains IDEs offer a more "curated" and deeply integrated development experience, reducing the need for extensive extension management and configuration. The key to leveraging this without feeling overwhelmed is to start simple, rely heavily on "Find Action" and "Alt+Enter," and incrementally discover features as your needs arise.
