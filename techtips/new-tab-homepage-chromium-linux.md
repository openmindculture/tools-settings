# New tab home page in Chromium on Linux

## Step 1: Create the Policy Configuration Directory

Chromium reads policy JSON files stored in specific system directories. Open your Linux terminal and create the required managed policy directory structure by running:

```bash
sudo mkdir -p /etc/chromium/policies/managed/
```

## Step 2: Create and Write the Policy File

Generate a JSON configuration file inside that directory containing the target URL policy strings. You can use nano or any text editor to create a file named `custom_new_tab.json`:

`sudo vi /etc/chromium/policies/managed/custom_new_tab.json`

Paste the exact JSON structure below into the file.

Replace https://example.com with the actual website or local HTML file path you want to open:

```json
{
  "NewTabPageLocation": "https://example.com"
}
```