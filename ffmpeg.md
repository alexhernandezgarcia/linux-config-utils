# ffmpeg

## Compress video

```
ffmpeg -i input.mp4 -vcodec h264 -acodec aac output.mp4
ffmpeg -i input.mp4 -vcodec libx265 -crf 20 output.mp4
```

The higher `crf` the more compression

### References

* [Stack overflow](https://unix.stackexchange.com/a/38380/320582)
* [https://bparkerproductions.com/linux-how-to-easily-compress-a-video-with-ffmpeg/](https://bparkerproductions.com/linux-how-to-easily-compress-a-video-with-ffmpeg/)

## Extract audio from video

### MP3
```
ffmpeg -i input.mp4 -q:a 0 -map a output.mp3
```

### Copy codec from video
```
ffmpeg -i input-video.avi -vn -acodec copy output-audio.aac
```

[StackOverflow](https://stackoverflow.com/questions/9913032/how-can-i-extract-audio-from-video-with-ffmpeg)

## Audio to 16khz 16bit mono wav

```
ffmpeg -i yourfile.mp3 -acodec pcm_s16le -ac 1 -ar 16000 myfile.wav
```

### References

- [StackOverflow](https://stackoverflow.com/questions/27730529/how-can-we-convert-wav-file-to-text-by-using-pocketsphinx#comment87408137_27731245)

## Extract excerpt from video

```
ffmpeg -i input.mp4 -vcodec copy -acodec copy -ss 00:00:00 -t 01:00:00 -sn part1.mp4
```

* `-ss` specifies the start time.
* `-t` specifies the duration of the clip.
* `-to` specifies the end time.

### Re-encoding the output

Sometimes, using -c copy leads to output files that some players cannot process properly (showing black frames at the beginning or with audio-video sync errors).

It is possible to re-encode the output video and audio according to the format you chose. For example:

```
ffmpeg -i input.mkv -ss 00:00:02.500 -to 00:00:15.200 -c:v libx264 -crf 23 -c:a aac -b:a 192k excerpt.mp4
```

### References

- [superuser](https://superuser.com/a/377407/1028786)
