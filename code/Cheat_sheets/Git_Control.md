# Git control commands
- General commands
<br> `git --version`
<br> `git --global` 
<br> `git config --global credential.helper cache` - Set git to use the credential memory cache
<br> `git config --global credential.helper 'cache --timeout=3600'` - Set the cache to timeout after 1 hour (setting is in seconds)
<br> `git config` - set up your local git environment (typically copy and paste commands from elsewhere). Be sure to customize values in quotes for you

 `git config --global user.name "Your Name"
  git config --global user.email "your_name@email.com"
  git config --global github.user "your_github_account_name"
  git config --global core.autocrlf input
  git config --global core.editor "nano -w"
  git config --global --list`


<br> `git init` - create a git repository (look for .git/ when you use ls -a)

- To make and commit changes in the **local** repository
<br> Make a change or add a file, then:
<br> `git status` - to see how things are
<br> `git add filename` - to staged the change
<br> `git status` - to see status, should show changes to be commited
<br> `git commit -m "message why the changes"` - commit changes
<br> `git status` - See status, should show no changes to be commited

- To move the changes to the **global** repository
<br> `git pull` - takes remote repository down to your local computer and merges changes
<br> `git push` - push up the changes to the global repository
<br> `git status` - should display "branch is up-to-date with 'origin/master'" if OK
ncontrerasortiz
nataliacon1