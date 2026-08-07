# ffmpeg

- `ffmpeg -i filename` shows details, "i" is for **input** not for information

## ffmpeg truncate without recoding using seek parameter

- `ffmpeg -y -ss 00:00:10 -to 00:00:30 -i input.mp4 -c copy output.mp4`

  - `y` yes, overwrite existing output file
  - `-ss 00:00:10` start at 10 seconds
  - `-to 00:00:30`  end at 30 seconds 
    - measured from the start of the input, not relative to `-ss` when `-to` comes after `-i `
  - `-c` copy stream without re-encoding

### Using duration instead of end time

- `ffmpeg -ss 00:00:10 -i input.mp4 -t 20 -c copy output.mp4`

  - `-t 20` cuts 20 seconds of output starting from the seek point

### Other Parameters

- Omit the ffmpeg seek or to parameter to truncate a video only at the end or only cut at the beginning.

- Seek before input parameter implies quicker search process.

- ffmpeg defaults to anchor seek and cut points to the nearest keyframes.

### Embed a custom cover image into the file (per-file control)

This is the most reliable way to control an individual file's thumbnail, since some thumbnailers (ffmpegthumbnailer with prefer_embedded_metadata=1, and apps like VLC) will read embedded cover art.

Container must support this; (MP4/MKV work well; some containers don't.

Code: tbd.

## Audio

Can I use ffmpeg to trim audio-only files generated with simple screen recorder (SSR) without reencoding, or do I need special audio-only tools when I want to discard the video?

Yes, ffmpeg handles this fine — no special audio-only tools needed.

Basic command:

```
ffmpeg -i input.mkv -vn -c:a copy -ss 00:00:10 -to 00:01:30 output.mka
```

For broad compatibility across stock Android apps (Music, Gallery, WhatsApp, Messages, file managers), your safest bet is .m4a (AAC in an MP4 container). It's played natively by virtually every media app, share sheet, and messaging app on Android without exception.

If your SSR recording's audio codec is already AAC, you can remux straight to .m4a with no quality loss:

```
ffmpeg -i input.mkv -vn -c:a copy output.m4a
```

If you're recording with SSR and plan to discard the video, you've got two paths:

Best option: set SSR to record audio-only from the start. Simple Screen Recorder has an "Audio only" checkbox in its recording settings — if you enable that, it skips capturing video entirely and just saves an audio-only container (typically Matroska audio, .mka, with whatever codec you configured — usually Opus or Vorbis). This saves disk space and encoding time during the actual recording, since it's not wasting effort compressing video you'll throw away.

For further audio editing, like mixing multiple audio tracks that overlap at the same time, free and open source software like Audacity should be good enough and it has a low learning curve. Another alternative: Ocenaudio	with clean, straightforward multi-track mixing with instant effect feedback; possibly even easier UX than Audacity.

Further reading: [Audio and Video Recording and Editing Software](https://dev.to/ingosteinke/audio-and-video-recordingediting-software-1kl4) by Berlin-based web developer Ingo Steinke on DEV.to, published in 2023, updated in 2025, as part of his blog post series about multimedia content creation.