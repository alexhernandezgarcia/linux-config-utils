# How to fix full storage crisis on my Fairphone

At least three times since I have my Fairphone, I have got into a crisis in which the phone does not start up normally because the storage is full. Specifically, what happens is that first the phone crashes and goes off or reboots itself. When I attempt to turn it on again, it displays a message saying "Can't create log file" (or the like). Then, it goes off again and enters recovery mode.

The way I have found to fix this problem is by using [Android Debug Bridge (adb)](https://developer.android.com/tools/adb) to access the filesystem of the phone from a computer and find a large file (typically a video) that I can mostly safely remove.

The steps are as follows:

1. Install adb in the computer, following this guide: [doc.e.foundation/pages/install-adb](https://doc.e.foundation/pages/install-adb)

2. Connect the phone to a computer with a USB cable.

3. With the phone showing the recovery screen, navigate to _Adavanced_, then _Enable ADB_.

4. Check that adb is detecting the phone with `./adb devices`

5. Start an interactive shell with `./adb shell`. This allows to more easily inspect the filesystem with linux commands.

6. A problem seems to be that, at least on my Fairphone, disk encryption is used, so there is no direct access to the data and the files structure. We need to mount the relevant directory:

```
mkdir -p /mnt/userdata
mount /dev/block/bootdevice/by-name/userdata /mnt/userdata/
```

Massive credit to [tcecyk](https://community.e.foundation/u/tcecyk) for pointing this out [here](https://community.e.foundation/t/how-to-mount-encrypted-data-partition-in-recovery-mode/45172/14).

7. Now we can change directory to `/mnt/userdata/` where we can see some meaningful directories, for example `/mnt/userdata/media/`.

8. We can figure out which are the largest files in the media directory with the [following command](https://www.cyberciti.biz/faq/linux-find-largest-file-in-directory-recursively-using-find-du/): `find /mnt/userdata/media/ -type f -printf '%s %p\n' | sort -nr | head -10`

9. To decide which file(s) to delete, we can check their creation dates and file types (`ls -lh`)

10. After deleting one or more large files, we should be able to reboot the phone, but first unmount the directory with `umount /mnt/userdata/` and exit the shell with `exit`.
