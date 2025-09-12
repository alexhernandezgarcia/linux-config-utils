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

## Preserving group ownership in taget directory

Running rsync with the `-a` flag will preserve the source group and owner alongside other properties. While this is fine in many cases, in can be problematic when the target directory is a shared directory. In particular, this has caused hitting the user quota in a shared directory where the group has a large quota but individual users do not.

In short, the solution is the following:

1. Create a file in the home directory named `~/.popt` with the following content: 

```
rsync alias -Z --no-p --no-g --chmod=Dg+s
```

2. Whenever you want to use rsync with a target directory where the permissions and ownsership of the target directory should be preserved, use the flag `-Z` in the command. For example:

```
rsync -aZ source/dir/ shared/target/dir/
```

### Explanation

Running rsync with the `-Z` flag causes rsync to use the alias (options) defined in the `~/.popt` file. The options defined in the alias are the following:

- `--no-p`: disables the `--perms` or `-p` option, which "causes the receiving rsync to set the destination permissions to be the same as the source permissions", and is included in `-a`.
- `--no-g`: disables the `--group` or `-g` option, which "causes rsync to set the group of the destination file to be the same as the source file", and is included in `-a`.
- `--chmod=Dg+s`: applies the `chmod` options specified after the `=` to the permission of the files in the transfer. `Dg+s` will make directories (`D`) inherit the setgid bit (set group ID), to enable group inheritance.

Without `g+s`, directories created by a user in a shared directory will inherit the primary group of the user, instead of the group of the parent directory.

In case rsync is run to transfer files or directories to a target directory without the above options, one may see (with `ls -la`) that the setgid bit is `x` (instead of `s`) in the group execute position. This may cause quota issues, for instance. This can be changed with `chmod g+s` followed by the file or directory to be updated.

## References

- [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps)

