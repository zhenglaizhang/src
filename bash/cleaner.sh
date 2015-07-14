#!/bin/bash
# The sha-bang (	#!) [1] at the head of a script tells your system that this file is a set of commands to be fed to the command interpreter indicated. The #! is actually a two-byte [2] magic number, a special marker that designates a file type, or in this case an executable shell script (type man magic for more details on this fascinating topic). Immediately following the sha-bang is a path name. This is the path to the program that interprets the commands in the script, whether it be a shell, a programming language, or a utility. This command interpreter then executes the commands in the script, starting at the top (the line following the sha-bang line), and ignoring comments.
# Note again that #!/bin/sh invokes the default shell interpreter, which defaults to /bin/bash on a Linux machine.
# If, in fact, the script includes an extra #! line, then bash will interpret it as a comment.
# Note that the path given at the "sha-bang" must be correct, otherwise an error message -- usually "Command not found." -- will be the only result of running the script
# To avoid this possibility, a script may begin with a #!/bin/env bash sha-bang line. This may be useful on UNIX machines where bash is not located in /bin
# If Bash is your default shell, then the #! isn't necessary at the beginning of a script.	However, if launching a script from a different shell, such as tcsh, then you will need the #!.


# Having written the script, you can invoke it by sh scriptname, [1] or alternatively bash scriptname. (Not recommended is using sh <scriptname, since this effectively disables reading from stdin within the script.) Much more convenient is to make the script itself directly executable with a chmod.

# chmod 555 scriptname (gives everyone read/execute permission)
# chmod +rx scriptname (gives everyone read/execute permission)
# chmod u+rx scriptname (gives only the script owner read/execute permission)

# As a final step, after testing and debugging, you would likely want to move it to /usr/local/bin (as root, of course), to make the script available to yourself and all other users as a systemwide executable. The script could then be invoked by simply typing scriptname [ENTER] from the command-line.


LOG_DIR=/var/log
ROOT_UID=0   
LINES=50
E_XCD=86
E_NOTROOT=87

if [ "$UID" -ne "$ROOT_ID" ]; then
    echo "Must be root to run this script"
    exit $E_NOTROOT
fi

# Test argument is present (non-empty)
if [ -n "$1" ]; then 
    lines="$1"
else
    lines=$LINES
fi


cd $LOG_DIR || {
    echo "Cannot change to $LOG_DIR" >&2
    exit $E_XCD
}
# if [ "$PWD" != "$LOG_DIR" ]; then
    # echo "Cannot change to $LOG_DIR"
    # exit $E_XCD
# fi

tail -n $lines messages > msg.temp
mv msg.temp messages

# cat /dev/null > messages
cat /dev/null > wtmp
#  ': > wtmp' and '> wtmp'  have the same effect.


echo "Logs cleaned up"

exit 0
# a bare exit returns the exit status of the preceding command