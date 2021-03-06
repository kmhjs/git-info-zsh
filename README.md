# Git-info-zsh (git related commands)

This project was created for display information on (z)shell-prompt.
Currently, this project supports `zsh`. (Written in `zsh-script`)

## How it works

You may get following string by calling `git-colorized-info`.

Example.

`master(uamd/s:2/h:10)`

* First element shows current branch name
* 2nd element (`uamd`) shows current status.
    * `u` : Untracked files are exist
    * `a` : File was added
    * `m` : File was modified
    * `d` : File was deleted
* 3rd element shows number of stashes
* 4th element shows number of forwarding commits between `master` and current `HEAD`.

## Usage

In your `.zshrc`, add few lines by following descriptions.

1. First, you need to enable `autoload`. Write `typeset -U fpath` before you write `autoload` statements.
2. Next, `clone` this project in your favorite directory. After here, stored directory path will be written as `${PLUGIN_PATH}`.
3. Then, load plugins as follows.

    ```
    FPATH=${PLUGIN_PATH}/src:${FPATH}
    source ${PLUGIN_PATH}/src/load_git-info-zsh
    ```

4. Now, the plugin is ready. Use them in your prompt etc. Here is example for right prompt. (Only show git information)

    `RPROMPT=$'$(git-colorized-info)'`

## Environment

* `zsh`
    * Version `5.3.0`

## License

See `LICENSE`.

## Others

* Fork me.
    * Modify.
    * Make pull request.
* Happy hacking :)
