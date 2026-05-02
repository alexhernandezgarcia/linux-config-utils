# Making GIFs from the command line

It is straightforward to create GIFs from a set of images, directly from the Linux command line. One way is to use [ImageMagick](http://www.imagemagick.org/script/index.php).

## Install

```
sudo apt install imagemagick
```

## Basic use

```
convert -delay 2x1 -loop 0 *.png output.gif
```

This will create a GIF named `output.gif` out of all the PNG images in the current directory. Each image will be display for 2 seconds, because of `-delay 2x1`. To set a period of one 10th of a second, use `-delay 1x10`. The GIF will loop forever because of `-loop 0`. To make it loop just twice, set `-loop 2`.

## References

- [ImageMagick reference page](https://usage.imagemagick.org/anim_basics/)
- [AskUbuntu](https://askubuntu.com/questions/648244/how-do-i-create-an-animated-gif-from-still-images-preferably-with-the-command-l)
