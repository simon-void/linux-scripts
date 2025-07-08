#!/bin/bash -e

sudo aptitude install git -y

# see https://blog.gitbutler.com/how-git-core-devs-configure-git/
echo '
[user]
        name = SSchroeder
        email = simon.void@gmx.de
[alias]
        lol = log --oneline --graph --all

# clearly makes git better

[column]
        ui = auto
[branch]
        sort = -committerdate
[tag]
        sort = version:refname
[init]
        defaultBranch = main
[diff]
        algorithm = histogram
        colorMoved = plain
        mnemonicPrefix = true
        renames = true
[push]
        default = simple
        autoSetupRemote = true
        followTags = true
[fetch]
        prune = true
        pruneTags = true
        all = true

# why the hell not?

[help]
        autocorrect = prompt
[commit]
        # verbose = true
[rerere]
        enabled = true
        autoupdate = true
[core]
        # ensure line endings in files you checkout are correct for linux
        autocrlf = input
        excludesfile = ~/.gitignore
[rebase]
        autoSquash = true
        autoStash = true
        updateRefs = true

# a matter of taste (uncomment if you dare)

[core]
        # fsmonitor = true
        # untrackedCache = true
[merge]
        # (just 'diff3' if git version < 2.3)
        conflictstyle = zdiff3
[pull]
        rebase = true
' > ~/.gitconfig
