## Resources

* [Open Resources for Learning and Using Git & Github](https://github.com/openlists/GitResources)
* [Git for collaborative documentation - by cassgvp](https://cassgvp.github.io/git-for-collaborative-documentation/)

## What is **HEAD**?
**HEAD** is a reference to the last commit in the currently check-out branch. The actual reference can be seen by doing:
```
cat .git/HEAD
```

For a new repository, `git` will default point **HEAD** to the master branch

### References
* [researchhubs.com](http://researchhubs.com/post/computing/git/what-is-HEAD-in-git.html)
* [backlog.com](https://backlog.com/git-tutorial/using-branches/git-switch-branches/)

## What are the tilde (~) and caret (^)?
The ~ (tilde) and ^ (caret) symbols are used to point to a position relative to a specific commit. The symbols are used together with a commit reference, typically HEAD or a commit hash.

* `~<n>` refers to the n-th grandparent. For example, `HEAD~1` refers to the last commit's parent

### References
* [backlog.com](https://backlog.com/git-tutorial/using-branches/git-switch-branches/)

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

### Fix by merging the current status with master

1. Create a new branch that will contain the current status of the files
```
git checkout -b detached-head
```
2. Switch to the master branch and merge it with the changes in the detached HEAD
```
git checkout master
git merge detached-head
```
3. Resolve the conflicts and commit the merge

### Fix by turning the current status into the master branch - might lose the commit history

This approach will potentially discard part of the commit history, but it is easier in case the merge of the old master branch and the current status is tricky, or you simply do not mind losing part of the commit history.

1. Manually back up the repository, in case things go unexpectedly wrong.
2. Commit the last changes you would like to keep. 
3. Create a temporary branch (let's name it `detached-head`) that will contain the files in their current status:
```
git checkout -b detached-head
```
4. (a) Delete the master branch if you do not need to keep it
```
git branch -D master
```
4. (b) OR rename if you want to keep it
```
git branch -M master old-master
```
5. Rename the temporary branch as the new master branch
```
git branch -M detached-head master
```

Credit: adapted from [this Medium article](https://medium.com/@garylai_34633/how-to-fix-detached-head-in-git-5b518574c11a) by Gary Lai.

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

### References
* [`git remote` documentation](https://git-scm.com/docs/git-remote)
* [`git push` documentation](https://git-scm.com/docs/git-push)
* [Stack Overflow](https://stackoverflow.com/questions/12543055/how-to-push-new-branch-without-history)
* [Stack Overflow](https://stackoverflow.com/questions/5181845/git-push-existing-repo-to-a-new-and-different-remote-repo-server)

