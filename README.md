# git_related_commands

This project was created for display information on shell-prompt.

Currently, this project supports zsh (tested with zsh 5.0.2 (x86_64-pc-linux-gnu)). And some other POSIX-based shell may use this script.

## How it works

You may get following string by calling `git-colorized-info`.

Example.

`master(uamd/s:2/h:10)`

* First element shows current branch name
* 2nd element (`uamd`) shows current status.
    * u : Untracked files are exist
    * a : File was added
    * m : File was modified
    * d : File was deleted
* 3rd element shows number of stashes
* 4th element shows number of forwarding commits between master and current HEAD.

## Usage

In your `.zshrc`, add few lines by following descriptions.

1. First, you need to enable `autoload`. Write `typeset -U fpath` before you write `autoload` statements.
2. Next, `clone` this project in your favorite directory. After here, stored directory path will be written as `$PLUGIN_PATH`.
3. Then, load plugins as follows.

`
FPATH=$PLUGIN_PATH/src:$FPATH
autoload -Uz git-in-repository
autoload -Uz git-commit-diff
autoload -Uz git-commit-diff-current-master
autoload -Uz git-commit-diff-current-master-count
autoload -Uz git-current-branch-name
autoload -Uz git-modified-count
autoload -Uz git-stash-count
autoload -Uz git-untracked-count
autoload -Uz git-added-count
autoload -Uz git-deleted-count
autoload -Uz git-colorized-info
`

4. Now, the plugin is ready. Use them in your prompt etc. Here is example for right prompt. (Only show git information)

`
RPROMPT=$'$(git-colorized-info)'

## License

See LICENSE.

## Others

* Fork me :)
* Happy hacking :)
