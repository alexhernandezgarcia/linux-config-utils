# Git

## Resources for getting started

* [Open Resources for Learning and Using Git & Github](https://github.com/openlists/GitResources)
* [Git for collaborative documentation - by cassgvp](https://cassgvp.github.io/git-for-collaborative-documentation/)

## `add`

* `git add -A` stages all changes
* `git add .` stages new files and modifications, without deletions
* `git add -u` stages modifications and deletions, without new files

That is, `git add -A` is equivalent to `git add .; git add -u`.

### References
* [StackOverFlow](https://stackoverflow.com/a/572660/6194082)

## What is **HEAD**?
**HEAD** is a reference to the last commit in the currently check-out branch. The actual reference can be seen by doing:
```
cat .git/HEAD
```

For a new repository, `git` will by default point **HEAD** to the main branch

### References
* [researchhubs.com](http://researchhubs.com/post/computing/git/what-is-HEAD-in-git.html)
* [backlog.com](https://backlog.com/git-tutorial/using-branches/git-switch-branches/)

## What are the tilde (~) and the caret (^) symbols?
The ~ (tilde) and ^ (caret) symbols are used to point to a position relative to a specific commit. The symbols are used together with a commit reference, typically HEAD or a commit hash.

* The tilde symbol `rev~n` refers to the n-th parent of commit `rev`. For example, `HEAD~1` refers to the last commit's parent.
* The caret symbol `rev^n` refers to the n-th parent of _merge commit_ `rev`. 
* As a rule of thumb, use the tilde `~` because the caret `^` is specifically used for _merge commits_.

### References
* [StackOverFlow](https://stackoverflow.com/a/2222920/6194082)

## Resolve merge conflicts using the command line

The GitHub documentation about this topic is pretty good.

### References
* [Docs GitHub](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-using-the-command-line)

## Fix detached HEAD 

A detached HEAD refers to a situation in which changes have been commited without specifying which branch they belong.

### Forcedly create a detached HEAD

One way to forcedly create a detached HEAD is the following:

1. Initialize a repository and create a couple of commits:
```
git init
touch file1
git add file1
git commit -m 'commit 0'
echo 'version 1' > file1
git add file1
git commit -m 'commit 1'
```
2. Checkout the previous commit to create a detached HEAD:
```
git checkout HEAD^
```
3. Check that the current status is "HEAD detached"
```
git status
```
4. Keep adding changes and commiting
```
echo 'version 2' > file1
git add file1
git commit -m 'commit 2'
```

### Fix by merging the current status with main

1. Create a new branch that will contain the current status of the files
```
git checkout -b detached-head
```
2. Switch to the main branch and merge it with the changes in the detached HEAD
```
git checkout main
git merge detached-head
```
3. Resolve the conflicts and commit the merge

### Fix by turning the current status into the main branch - might lose the commit history

This approach will potentially discard part of the commit history, but it is easier in case the merge of the old main branch and the current status is tricky, or you simply do not mind losing part of the commit history.

1. Manually back up the repository, in case things go unexpectedly wrong.
2. Commit the last changes you would like to keep. 
3. Create a temporary branch (let's name it `detached-head`) that will contain the files in their current status:
```
git checkout -b detached-head
```
4. (a) Delete the main branch if you do not need to keep it
```
git branch -D main
```
4. (b) OR rename if you want to keep it
```
git branch -M main old-main
```
5. Rename the temporary branch as the new main branch
```
git branch -M detached-head main
```

Credit: adapted from [this Medium article](https://medium.com/@garylai_34633/how-to-fix-detached-head-in-git-5b518574c11a) by Gary Lai.

### References

* [My answer on StackOverFlow](https://stackoverflow.com/a/64123943/6194082)


## Push new branch without history to new repository

1. Create new branch `public` without history
```
git checkout --orphan public
git commit
```
2. Create new repository `https://github.com/user/new-repo.git` on GitHub
3. Add new remote `public-remote` assigned to the new repository
```
git remote add public-remote https://github.com/user/new-repo.git
```
4. Push `public` branch to the new repo's remote
```
git push public-remote public
```

## Syncing a fork

* See: [Syncing a fork from the command line](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/syncing-a-fork#syncing-a-fork-from-the-command-line)

To merge with branch `main`:

```
git fetch upstream
git checkout main
git merge upstream/main
```

### References
* [`git remote` documentation](https://git-scm.com/docs/git-remote)
* [`git push` documentation](https://git-scm.com/docs/git-push)
* [Stack Overflow](https://stackoverflow.com/questions/12543055/how-to-push-new-branch-without-history)
* [Stack Overflow](https://stackoverflow.com/questions/5181845/git-push-existing-repo-to-a-new-and-different-remote-repo-server)

## Reviewing a Pull Request

### Review and edit locally

1. Move into the local clone of the repository
2. Add a remote for the PR author’s repo: 
```
git remote add <author-id> git://github.com/<author-id>/<repo-name>.git
```
3. Fetch the PR: 
```
git fetch <author-id> <name-of-the-PR-branch>
```
4. Checkout that branch: 
```
://s3-us-west-2.amazonaws.com/clarivate-scholarone-prod-us-west-2-s1m-public/wwwRoot/prod1/societyimages/tmi-ieee/tmi-cover3-2226650-x.pdf
git checkout <name-of-the-PR-branch>
```

## Working with multiple remote repositories

Here is a basic guide about how to work with multiple repositories. Let's assume our default remote repository is called "origin" (Git's default) and lives in `https://github.com/username/origrepo`. Then, there is another related repository (typically a fork of the original one) that lives in `https://github.com/username/forkedrepo`. Let's called the forked repository "forked".

### Listing the remote repositories

First, you can list the current remote repositories with:

```bash
git remote -v
```

If you have not made any changes to the default configuration, you will likely get something like:

```bash
origin  git@github.com:username/origrepo.git (fetch)
origin  git@github.com:username/origrepo.git (push)
```

### Adding a new remote repository

Now, it may be useful to add to the list of remote repositories the "forked" repository. If we want to call it `forked`, we can use this command:

```bash
git remote add forked git@github.com:username/forkedrepo.git
```

The updated list shown by `git remote -v` should now be:

```
origin  git@github.com:username/origrepo.git (fetch)
origin  git@github.com:username/origrepo.git (push)
forked  git@github.com:username/forkedrepo.git (fetch)
forked  git@github.com:username/forkedrepo.git (push)
```

### Renaming a remote repository

Sometimes it can be helpful to rename a remote repository. For illustration purposes, let's rename `origin` to `original`. The command is `git remote rename <old-name> <new-name>`. So after running `git remote rename origin original`, `git remote -v` should return:

```bash
original     git@github.com:username/origrepo.git (fetch)
original     git@github.com:username/origrepo.git (push)
forked  git@github.com:username/forkedrepo.git (fetch)
forked  git@github.com:username/forkedrepo.git (push)
```

### Merging a branch from the forked repository

A common action we may want to often do is fetching changes in the forked repository, for instance after a PR is merged into its `main` branch. These are some steps we can follow, assuming we have added the forked repository to the list of remotes (see above).

1. Fetch the branch from the forked repository that we are interested in. For instance, `main`:

```bash
git fetch forked main
```

2. Create a new branch for the new changes. For instance, `main-forked`:

```bash
git checkout -b main-forked
```

Note that the order of the first two steps above does not matter.

3. Merge the main branch of the forked repository into the new branch:

```bash
git merge forked/main main-forked
```

4. Push the changes to a new remote branch (for example, `main-forked`) on the original repository:

```bash
git push original main-forked
```
Finally, it is also possible to set the default upstream branch to the desired repository and branch. For example, to set it to the main branch of the forked repository:

```bash
git branch --set-upstream-to=forked/main
```

## Renaming local and remote branch

1. Rename local branch
```
git branch -m old-name new-name
```

2. Push local branch by explicitly setting the upstream branch
```
git push --set-upstream origin new-name
```

3. Delete old remote branch
```
git push origin --delete old-name
```

Note that if old-name is the default branch in the remote repository the deletion will be rejected:
```
 ! [remote rejected] old-name (refusing to delete the current branch: refs/heads/old-name)
error: failed to push some refs to ...
```

You first have to change the default. On GitHub: Settings > Branches > Default branch

### References

- [StackOverflow: git: how to rename a branch (both local and remote)?](https://stackoverflow.com/questions/30590083/git-how-to-rename-a-branch-both-local-and-remote)

## _Forking_ your own repository

Forking your own repository is not an operation that GitHub offers, but it is one I find myself needing very often. While, to my knowledge, there is no way to exactly fork your own repo on GitHub (or even have more than one fork of any repo), it is possible to manually set up your local copies with multiple _remote_ repositories and obtain _some_ of the functionality of forks:

1. Create the new repository on GitHub. Let's assume it is called `new-repo`

2. Clone the original repository (let's assumme it is called `orig-repo`) locally with the name of the new repository and change directory into the local copy:
```
git clone git@github.com:username/orig-repo.git
cd new-repo
```

You can check that currently the remote repository associated to the local copy is the original repository with `git remote -v`. It should return something like
```
origin  git@github.com:username/orig-repo.git (fetch)
origin  git@github.com:username/orig-repo.git (push)
```

3. Rename the name of the remote repository from `origin` to `upstream` (for example), since we want to reserve the name `origin` for the new repository
```
git remote rename origin upstream
```

4. Add a new remote repository called `origin` pointing to the new repository
```
git remote add origin git@github.com:username/new-repo.git
```

You can check that the new remote repository has been added with `git remote -v`:
```
origin  git@github.com:username/new-repo.git (fetch)
origin  git@github.com:username/new-repo.git (push)
upstream  git@github.com:username/orig-repo.git (fetch)
upstream  git@github.com:username/orig-repo.git (push)
```

5. Push to the new repository. You push just the main branch (`git push origin main`)  or everything (`git push --all`) or something else.

### References
* [Forking your own repository](https://stackoverflow.com/questions/10963878/how-do-you-fork-your-own-repository-on-github)

### References
* [Working with Pull Requests as a reviewer](https://web-platform-tests.org/reviewing-tests/git.html)
* [Forking your own repository](https://stackoverflow.com/questions/10963878/how-do-you-fork-your-own-repository-on-github)
* [learn git branching](https://learngitbranching.js.org/)
