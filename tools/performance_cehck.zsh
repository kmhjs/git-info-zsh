#! /usr/bin/env zsh

function nano_unix_time() {
    date +%s%N
}

function show_proc_time() {
    cmd=${1}

    start_t=$(nano_unix_time)
    ${cmd} 1>/dev/null 2>/dev/null
    printf "%40s : time -> %10d\n" ${cmd} $(($(nano_unix_time) - ${start_t}))
}

# Load
for f ($(find . -iname 'git-*')); do
    source ${f}
; done

for f ($(find . -iname 'git-*')); do
    show_proc_time $(echo ${f} | tr -d './')
; done
