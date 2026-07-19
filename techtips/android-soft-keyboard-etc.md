# Android User Tech Tips

Updated an tested with Android 16 on The Fairphone Gen. 6 in 2026 and Android 13 (?) on Google Pixel 4a in 2025 and 2026.

## Keep Chrome as Default Browser

Making Android 16 open all apps in Firefox prevents correct startup of financial apps like Scalable.

You can still use Firefox as the preferred default browser. You can still manually open Firefox.

You can open PWA web apps in Firefox and set them as apps on the home screen. As an alternative to install native apps, this works with Duolingo in 2026. 

## Multilingual (Multi-Language) Input with Google Keyboard (gboard Android app)

Gboard does not have a single static keyboard layout that displays all Western characters (such as ñ, ç, ö, or ä) at once on the primary screen. To easily access these characters without constantly switching layouts, you should enable Multilingual Typing and use the long-press accent feature. The issue is a specific bug where Gboard’s QWERTY multilingual engine prioritizes German and French character maps over Turkish, causing the ı and ş to drop off the long-press menu entirely. Gboard tries to blend the dictionaries and character sets. However, Gboard limits multilingual pairing to a maximum of 3–4 closely related languages, prioritizing languages that share identical base character sets (like French and English). Thus we need to uninstall French to get back the Turkish chars.

In settings gboard on Android 16 has a per-language sub-setting to allow multi-language input while using that specific language.

### Swiftkey-like Swiping Input

When activated, we can swipe across the virtual soft keyboard with a one finger gesture shortly stopping at each letter without releasing the finger until the end of the word.

### Auto Space, Full Stop, Dot, Comma Settings and Bugs

Allowing auto-spacing after words, and auto-punctuation seems to work best and avoids bugs like missing spaces and hard manual cursor-placement at the unintentional unspaced word breaks after changing the spacing settings.

## Any Soft Keyboard (AnySoftKeyboard, ASK) and other Alternatives

Despite their free and open-source degoogle approaches and the fact that AnySoftKeyboard is also available in Google's Play Store and not only in F-Droid or other alternative Android app stores, I recently found gboard the smoothest and best-working soft keyboard for Android 16 on my Fairphone 6.

## Text Zoom Issues

The Android text size setting breaks the layout of speed limit signs, the frames around exit details, etc., in the Google Maps app, and causes similar issues in other apps on Android 16.

This is a useful feature to verify text zoom accessibility (WCAG 1.4.4) in the mobile view of our responsive websites and web apps as web developers, I would recommend not to increase text size globally due to the unintentional effects both on websites in mobile Firefox and Chrome and in native apps in Android 16.

### WCAG 1.4.4 Resize Text (Level AA)

This describes [WCAG 1.4.4 Resize Text (Level AA)](https://www.w3.org/WAI/WCAG22/Understanding/resize-text.html), which requires that text can be resized up to 200% without loss of content or functionality (i.e., without breaking layouts, causing overlap, clipping, or truncation).

The scenario you've described — Android's system text-size setting causing UI elements (like the "frames around exit details" or speed limit sign graphics in Google Maps) to overlap, clip, or otherwise break — is a real-world example of exactly what 1.4.4 is meant to catch, just triggered via the OS-level "Font size" accessibility setting instead of a browser zoom control.

Clarifying notes:

1.4.4 Resize Text (AA) applies specifically to text resizing (not full-page zoom) up to 200%, and requires no loss of content/functionality.
This is closely related to but distinct from 1.4.10 Reflow (AA), which covers zooming to 400% (equivalent to 320px CSS width viewport) without requiring two-dimensional scrolling.

Since you're testing via the Android system text-size setting rather than browser zoom, you're effectively exercising the same code path as a user with rem/em-based or OS-driven font scaling — which is a good proxy for 1.4.4 testing on mobile, since many mobile browsers tie their text scaling behavior to the OS accessibility font setting.