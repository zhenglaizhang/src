http://www.tldp.org/LDP/abs/html/special-chars.html


Caution: invoking a Bash script by sh scriptname turns off Bash-specific extensions, and the script may therefore fail to execute.

A script needs read, as well as execute permission for it to run, since the shell needs to be able to read it.

Why not simply invoke the script with scriptname? If the directory you are in ($PWD) is where scriptname is located, why doesn't this work? This fails because, for security reasons, the current directory (./) is not by default included in a user's $PATH. It is therefore necessary to explicitly invoke the script in the current directory with a ./scriptname.




Comment
Of course, a quoted or an escaped # in an echo statement does not begin a comment. Likewise, a # appears in certain parameter-substitution constructs and in numerical constant expressions.
echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # here begins a comment.

echo ${PATH#*:}       # Parameter substitution, not a comment.
echo $(( 2#101011 ))  # Base conversion, not a comment.

# Thanks, S.C.
The standard quoting and escape characters (" ' \) escape the 


"dot" command [period]. Equivalent to source (see Example 15-22). This is a bash builtin.
"dot", as a component of a filename. When working with filenames, a leading dot is the prefix of a "hidden" file, a file that an ls will not normally show.

null command [colon]. This is the shell equivalent of a "NOP" (no op, a do-nothing operation). It may be considered a synonym for the shell builtin true. The ":" command is itself a Bash builtin, and its exit status is true (0).

:
echo $?   # 0

while :
do
   operation-1
   operation-2
   ...
   operation-n
done

# Same as:
#    while true
#    do
#      ...
#    done


if condition
then :   # Do nothing and branch ahead
else     # Or else ...
   take-some-action
fi


command substitution. The `command` construct makes available the output of command for assignment to a variable. This is also known as backquotes or backticks.


In combination with the > redirection operator, truncates a file to zero length, without changing its permissions. If the file did not previously exist, creates it.
: > data.xxx   # File "data.xxx" now empty.	      

# Same effect as   cat /dev/null >data.xxx
# However, this does not fork a new process, since ":" is a builtin.
In combination with the >> redirection operator, has no effect on a pre-existing target file (: >> target_file). If the file did not previously exist, creates it.
This applies to regular files, not pipes, symlinks, and certain special files.

The ":" serves as a field separator, in /etc/passwd, and in the $PATH variable.
bash$ echo $PATH
/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/sbin:/usr/sbin:/usr/games

A colon is acceptable as a function name.
:()
{
  echo "The name of this function is "$FUNCNAME" "
  # Why use a colon as a function name?
  # It's a way of obfuscating your code.
}

:

# The name of this function is :
This is not portable behavior, and therefore not a recommended practice. In fact, more recent releases of Bash do not permit this usage. An underscore _ works, though.


A colon can serve as a placeholder in an otherwise empty function.

not_empty ()
{
  :
} # Contains a : (null command), and so is not empty.



!
reverse (or negate) the sense of a test or exit status [bang]. The ! operator inverts the exit status of the command to which it is applied (see Example 6-2). It also inverts the meaning of a test operator. This can, for example, change the sense of equal ( = ) to not-equal ( != ). The ! operator is a Bash keyword.

In a different context, the ! also appears in indirect variable references.

In yet another context, from the command line, the ! invokes the Bash history mechanism (see Appendix L). Note that within a script, the history mechanism is disabled.

wild card [asterisk]. The * character serves as a "wild card" for filename expansion in globbing. By itself, it matches every filename in a given directory.

bash$ echo *
abs-book.sgml add-drive.sh agram.sh alias.sh

The * also represents any number (or zero) characters in a regular expression.



test operator. Within certain expressions, the ? indicates a test for a condition.


In a double-parentheses construct, the ? can serve as an element of a C-style trinary operator. [2]

condition?result-if-true:result-if-false

(( var0 = var1<98?9:21 ))
#                ^ ^

# if [ "$var1" -lt 98 ]
# then
#   var0=9
# else
#   var0=21
# fi




Variable substitution (contents of a variable).
A $ prefixing a variable name indicates the value the variable holds.




exit status variable. The $? variable holds the exit status of a command, a function, or of the script itself.


process ID variable. The $$ variable holds the process ID [4] of the script in which it appears.







command group.
(a=hello; echo $a)

Important	
A listing of commands within parentheses starts a subshell.

Variables inside parentheses, within the subshell, are not visible to the rest of the script. The parent process, the script, cannot read variables created in the child process, the subshell.
a=123
( a=321; )	      

echo "a = $a"   # a = 123
# "a" within parentheses acts like a local variable.

array initialization.
Array=(element1 element2 element3)


{xxx,yyy,zzz,...}
Brace expansion.
echo \"{These,words,are,quoted}\"   # " prefix and suffix
# "These" "words" "are" "quoted"


cat {file1,file2,file3} > combined_file
# Concatenates the files file1, file2, and file3 into combined_file.

cp file22.{txt,backup}
# Copies "file22.txt" to "file22.backup"

No spaces allowed within the braces unless the spaces are quoted or escaped.
echo {file1,file2}\ :{\ A," B",' C'}

file1 : A file1 : B file1 : C file2 : A file2 : B file2 : C







Extended Brace expansion.
echo {a..z} # a b c d e f g h i j k l m n o p q r s t u v w x y z
# Echoes characters between a and z.

echo {0..3} # 0 1 2 3
# Echoes characters between 0 and 3.




{}
Block of code [curly brackets]. Also referred to as an inline group, this construct, in effect, creates an anonymous function (a function without a name). However, unlike in a "standard" function, the variables inside a code block remain visible to the remainder of the script.

bash$ { local a;
	      a=123; }
bash: local: can only be used in a
function
	      
a=123
{ a=321; }
echo "a = $a"   # a = 321   (value inside code block)

Unlike a command group within (parentheses), as above, a code block enclosed by {braces} will not normally launch a subshell. [6]





[ ]
test.

Test expression between [ ].	Note that [ is part of the shell builtin test (and a synonym for it), not a link to the external command /usr/bin/test.

[[ ]]
test.

Test expression between [[ ]]. More flexible than the single-bracket [ ] test, this is a shell keyword.

See the discussion on the [[ ... ]] construct.





command &>filename redirects both the stdout and the stderr of command to filename.
This is useful for suppressing output when testing for a condition. For example, let us test whether a certain command exists.
bash$ type bogus_command &>/dev/null
bash$ echo $?
1




command_test () { type "$1" &>/dev/null; }
#                                      ^

cmd=rmdir            # Legitimate command.
command_test $cmd; echo $?   # 0


cmd=bogus_command    # Illegitimate command
command_test $cmd; echo $?   # 1


command >&2 redirects stdout of command to stderr.





<, >
ASCII comparison.
veg1=carrots
veg2=tomatoes

if [[ "$veg1" < "$veg2" ]]
then
  echo "Although $veg1 precede $veg2 in the dictionary,"
  echo -n "this does not necessarily imply anything "
  echo "about my culinary preferences."
else
  echo "What kind of dictionary are you using, anyhow?"
fi


\<, \>
word boundary in a regular expression.

bash$ grep '\<the\>' textfile






pipe. Passes the output (stdout) of a previous command to the input (stdin) of the next one, or to the shell. This is a method of chaining commands together.

echo ls -l | sh
#  Passes the output of "echo ls -l" to the shell,
#+ with the same result as a simple "ls -l".


cat *.lst | sort | uniq
# Merges and sorts all ".lst" files, then deletes duplicate lines.


A pipe, as a classic method of interprocess communication, sends the stdout of one process to the stdin of another. In a typical case, a command, such as cat or echo, pipes a stream of data to a filter, a command that transforms its input for processing. [7]

cat $filename1 $filename2 | grep $search_word






The output of a command or commands may be piped to a script.
#!/bin/bash
# uppercase.sh : Changes input to uppercase.

tr 'a-z' 'A-Z'
#  Letter ranges must be quoted
#+ to prevent filename generation from single-letter filenames.

exit 0
Now, let us pipe the output of ls -l to this script.
bash$ ls -l | ./uppercase.sh
-RW-RW-R--    1 BOZO  BOZO       109 APR  7 19:49 1.TXT
 -RW-RW-R--    1 BOZO  BOZO       109 APR 14 16:48 2.TXT
 -RW-R--R--    1 BOZO  BOZO       725 APR 20 20:56 DATA-FILE
 
 
 
 
 
A pipe runs as a child process, and therefore cannot alter script variables.
variable="initial_value"
echo "new_value" | read variable
echo "variable = $variable"     # variable = initial_value

If one of the commands in the pipe aborts, this prematurely terminates execution of the pipe. Called a broken pipe, this condition sends a SIGPIPE signal.



&
Run job in background. A command followed by an & will run in the background.



Used with a Bash builtin, it means the end of options to that particular command.

Tip	
This provides a handy means of removing files whose names begin with a dash.
bash$ ls -l
-rw-r--r-- 1 bozo bozo 0 Nov 25 12:29 -badname


bash$ rm -- -badname

bash$ ls -l
total 0









home directory [tilde]. This corresponds to the $HOME internal variable. ~bozo is bozo's home directory, and ls ~bozo lists the contents of it. ~/ is the current user's home directory, and ls ~/ lists the contents of it.
bash$ echo ~bozo
/home/bozo

bash$ echo ~
/home/bozo

bash$ echo ~/
/home/bozo/

bash$ echo ~:
/home/bozo:

bash$ echo ~nonexistent-user
~nonexistent-user







~+
current working directory. This corresponds to the $PWD internal variable.

~-
previous working directory. This corresponds to the $OLDPWD internal variable.

=~