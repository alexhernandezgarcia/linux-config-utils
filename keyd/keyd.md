A simple but powerful way to remap keyboard keys is [`keyd`](https://github.com/rvaiya/keyd).

The [installation instructions](https://github.com/rvaiya/keyd) (from source) are very simple:

```
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
```

Below is my basic configuration to applly the following changes:

- CapsLock key is remapped to Escape when pressed
- CapsLock key is remapped to Control when held
- Alt+CapsLock is remapped to the original CapsLock

```
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

[alt]

# Remaps the combination alt+capslock to capslock
capslock = capslock

# Maps the combination alt+backspace to delete
backspace = delete
```

After changing the configuration, it can be reloaded with `sudo keyd reload` or `sudo systemctl restart keyd`

## Beyond the basics

Beyond this, the potential of key mapping is almost unlimited, as presented in [this blog post](https://wiki.ethanppl.com/blog/2024/09/08/keyd).

To grasp the potential, it is useful to first understand that `keyd` operates in layers. For example, in the basic configuration above, there is a main layer under `[main]`, and then there is an `[alt]` layer under which Alt combinations are specified.

But there is more: `keyd` allows you to create new layers! For example, I have found it useful to create a new layer under the key `\`, which in my (UK) keyboard is to the right of the left Shift key. This enables the creation of custom key combinations by holding `\` plus other keys.

## References

- [How I use keyd to remap my keyboard in Ubuntu 22.04 with Wayland](https://wiki.ethanppl.com/blog/2024/09/08/keyd)
- [keyd GitHub repository](https://github.com/rvaiya/keyd)
