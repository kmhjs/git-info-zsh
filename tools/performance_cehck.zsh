#! /usr/bin/env zsh

function milliseconds_unix_time() {
  echo $(($(date +%s%N) / 1000000.0))
}

function show_proc_time() {
  local cmd=${1}

  local avg_time=0

  local number_of_samples=5

  local start_time elapsed_time
  for i ({1..${number_of_samples}})
  do
    start_time=$(milliseconds_unix_time)
    ${cmd} 1>/dev/null 2>/dev/null
    elapsed_time=$(($(milliseconds_unix_time) - ${start_time}))

    avg_time=$((${avg_time} + ${elapsed_time}))
  done

  avg_time=$((${avg_time} / ${number_of_samples}))

  printf "%40s : time (%d times avg) -> %5f ms\n" ${cmd:t} ${number_of_samples} ${avg_time}
}

# Load
for f ($(find . -iname 'git-*'))
do
  source ${f}
done

for f ($(find . -iname 'git-*'))
do
  show_proc_time $(echo ${f} | tr -d './')
done
