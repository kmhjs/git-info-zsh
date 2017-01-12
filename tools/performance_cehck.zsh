#! /usr/bin/env zsh -f

# Load commands
for f ($(find . -iname 'git-*'))
do
  source ${f}
done

# Show how to see the result
echo -n "\e[32m"
cat <<EOF
- How to see the result
  - See the "time" row.
  - There are 3 rows in inside of "time" row.
  - See the 2nd row, it's "average time" of function execution, written in "ms (milliseconds)".

- Note: The execution time is depends on your PC, 'git' command and the status of this repository.

EOF
echo -n "\e[0m"

# Load zprof for profiling
zmodload zsh/zprof

# Configure parameters for profiling
typeset -i number_of_samples=5

# Run commands in ${number_of_samples} times for profiling
for command_file ($(find . -iname 'git-*'))
do
  for i ({1..${number_of_samples}})
  do
    # Execute command by parsing command name from file name
    typeset cmd=${command_file:t}
    ${cmd} 1>/dev/null 2>/dev/null
  done
done

# Show the result
zprof | less
