# rsync

## Basics 

Recursively synchronise the contents of directory `source` to directory `target` on the same system:

```
rsync -a source/ target
```

- `-a`: stands for "archive" and its effect is to synchronise recursively and preserve symbolic links, special and device files, modification times, group, owner, and permissions. It is more commonly used than `-r` and is usually what we want to use.
- The trailing slash (`/`) after `source` indicates that we want to synchronise the contents of `source`. Without the trailing slash, we would instead place the directory `source` itself inside `target`.

Other commonly used flags:

- `-n`: equivalent to `--dry-run`
- `-v`: verbose
- `-L`: equivalent to `--copy-links`, which copies the actual content of symbolic links (see [https://lists.samba.org/archive/rsync/2006-November/016724.html](https://lists.samba.org/archive/rsync/2006-November/016724.html)

## Synchronise with a remote system

We can also use `rsync` to synchronise content with a remote system. To synchronise content from a local to a remote directory (push):

```
rsync -a source/ username@remote_host:target_directory
```

To synchronise remote content to a local directory (pull):

```
rsync -a username@remote_host:/home/username/source local_directory
```

Some useful flags are the following:

- `-z`: the source data is compressed before synchronisation (useful when transferring through a network)
- `--partial`: keeps partially transferred files in the target directory even if thhe the connection gets interrupted. This is useful when synchronising big files.
- `--progress`: shows the progress during transfer
- `-P`: equivalent to `--partial --progress`

## How to exclude files and directories

To exclude files with a pattern:

```
rsync -a --exclude '*.pyc' source/ target
```

To exclude a directory:

```
rsync -a --exclude 'edir' source/ target
```

## References

- [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps)

