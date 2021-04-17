# Course BWF2020/21 Introduction to Linux and Shell Scripting  

## Day 1: 13-03-2021, Introduction to Linux operating system
- What is an OS: software that interfaces between user, application and hardware
- Unix: not free OS, Linus Torvalds wrote his own version
- Distro (distribution): Mint
- Shell: interface that allows user to act on the OS, graph or cmd line (bash)
    - Kernel: user does not control kernel, it operates the hardware itself
      - Hardware
- CLI Cmd line interface, GUI Graphical User interface

- PDB protein data bank: Process tools

- Why I am interested in this workshop
  - process tools for file : blast, awk
  - Analysis of genomic data, alingment and
  - Phylogenomics and RNA analysis

### Basic of the prompt
- ctrl+c = stop the process, abort
- `pwd` = path working directory

- Relative and Absolute path:
  `/` root folder  
  `~` home folder  
  `cd` alone, bring you to the home folder by itself

- Flags: modifies the command  
  - `ls -l[list details] -h[human readable]` or `ls -lh`
  - --help

  - Extras
    One dash - is for one character
    two dash -- is for a word

- cp copy, slower than mv, because this one creates a new file  
  `cp file1.txt file2.txt`: copies the file in the   
  `cp file1.txt file2.txt Folder/`: multiple files into a folder, beware of overwritting  
- mv changes the location and thus is faster than cp, because it does not create a new file. Better to change the name of files.

- Molecular dynamics: GPU (using the screen, pixel localtion) vs CPU (machine processing)

## Day 2: 20-03-2021 continue Basic commands

- ls -F : tells you what is in there, either file or Folder
- mv ethane.pdb methane.pdb ../raw/ : mv can move multiple files at once
- mkdir: can create several directories inside each other
- rm -rf: to delete -r recursive keep going, f force, to remove a directory
- \ escape character, tells linux to use literally the next character as a space ( ), this is for when files have spaces in the names.

- Wildcards
  - * matches 0 or more characters of any kind
      - If in the unlikely event you name a file with *, `\*` tells shell to use * as literally what it is.
  - ? matches exactly one character
      - ???.pdb matches files with three characters before pdb

- touch: creates an empty file
- clear: wipes everything on screen
- cat: display entire contents of files
- head: display first 10 lines,  with -[#] shows specific number of lines   
- tail: display last 10 lines, with -[#] shows specific number of lines
- sort: alphanumerical sorting just sorting based on the first character of the name
  - sort -n [file]: this sorts based on numerical only
- wc: counts and shows lines, words, characters.
    - Flags: -l lines, -m char, -c bytes, -w words

- Redirection
  - | pipe: redirect the output (everything after the pipe will only use the first's command output) of one command to other.
      command1 | command2
  - > : redirect output to a file. Does not append, rewrites.
  - >>: append output to an existing file, so it is to an existent file

- Example:
  - wc -l * | sort -n | head -n 3
  countr # of lines in file | sort numerically the files lowest to highest | print the first three.

- Installing and running things
    - sudo: forcing, super user do, sudo make me a sandwich
    - yum and apt-wget: packages used to install things
    - tar: tape archive, compress many files, like zip
        - tar -cf [name.tar] file1 file2 : compressed
        - tar -xf [file] : extract    
    - cron: used to schedule jobs

- Other commands
  - wget : get url
  - kill [name of command you want to stop]
  - Tab autocomplete: tab double and command shows all the possible combinations!
      - mk tab tab: shows all the options apart from mkdir
  - Highlight text and click the wheel button then it copies the text in the line.

- Filesystems (how files are handled), chronology
  1. MINIX: 14 characters, first filesystem
  2. ext: a bit longer
  3. ext2: increased file name and size
  4. ext3: introduce journaling system snapshot
  5. ext4: Standard filesystem in Linux
  6. ReiserFS and BtrFS
  7. ZFS
  8. RAID
  9. in Windows: NTFS, FAT32, exFAT

## Day 3: Text editors

#### `vim` the most use text editor, v improve  
`vim {file}`  
`vimtutor` file to learn to use vim  

- visualization modes
    - visual mode: v, default, hykl
    - edit: insert  
        a end of the sentence, A beginning of the sentence
        o new line after, O new line before
    - command: `:`

- edit mode mostly
w: beginning of the next word  
b: backwards at the beginning of the last word  
e: end of current words  
shift + w, shift + e, shift + b: ignore non space separators  

shift + arrow keys: to move around
insert: insert mode
insert + insert: replace mode

x, shift+x: to delete characters
`:q!` exit the document
`:wq`
swap file in vim

d+e, d+w, d+b, d+c: to delete during visual mode
D deletes all the line or cut
p o P, paste the last "deleted" or cut characters with d
y copy the line, yw word, yb previous word, can copy between files

u for undo as far as possible
ctrl + r: going forward, redo

1G moves to the top of the file, PgUp
1g moves to the bottom, PgDn
`:{line#}`  
`/[word to look for]`, to cycle between them `n` `N`
`:s/[word to substitute]/[new word]/`
`:%s/[word from]/[word to]/` change only the first instance

- visual mode, v : Highlight word by word use y or d, then p to paste  
- shift + V : visual line mode, Highlight entire line
- visual block mode: Highlight the block

- Exit
  `:q!` quit without saving
  `:w [file name]` write, save edit add `!` to overwrite the file
  `:wq!` quit, override

- Open several files at the same time
`vi [file 1] [file 2]`  
`:n` to go to the next files, `:q` Exit  
`vi [file 1] [file 2] -O`  Files side to side vertically (`-o` to horizontally), `ctrl+w+w` to move between Windows.
    `:wqa!`, to exit, and `a` to do the same operation for both files

- Vim adventures: pay $25 dollars [https://vim-adventures.com/]
- Vim Cheat sheet [https://vim.rtorr.com/]

#### sed: stream editor
- delete, p print, s substitute : only to print the output in the screen
`sed -n 1,2p [file]` just print the first and second line of a file  
`sed -n '3,8p' [file]`
`1~2d` every single lines
`sed s/word/zebra/g sed_tutorial`, g global, this prints out the word "word" changed to "zebra".  
`sed 1~2s/word/zebra/g sed_tutorial`
`s/word/zebra/1,2` all the instance after the second instance
- `sed -i s/zebra/word/g sed_tutorial` -i is like redirect >, to substite outputs ot a different file, if not use -i it will only print the output on the screen  

#### awk:
`awk '{print}' awk_tutorial` Print the output  
`awk 'NR==1{print}' awk_tutorial` NR==1 line number, print the first line
`awk 'NR<4{print}' awk_tutorial` print less than 4 lines
`awk 'NR<4{print}' awk_tutorial`
== making the comparison operator equal to  
= declaring a variable  
`awk 'NR==4{print}' awk_tutorial`  
`awk 'NR!=4{print}' awk_tutorial` ! not for,
`awk '{print $1}' awk_tutorial` $1, print the first column
`awk '{print $1, $1, $1}' awk_tutorial` Print the first column three times
`awk 'NR>1{sum+=$2; count+=1}END{print sum/count}' awk_tutorial` NR>1 to skip the first lines, += or ++ increment by one, sum sumar, count  
`awk 'NR>1{if ($4=="N") print $3}' awk_tutorial`
`&&` separate several operations
`awk 'BEGIN{print 3/4}'` Mathematical operatiosn in awk  

### Histogram: remember they are categorical
- Doing a Histogram with Awk: using file random2.txt, 2 dices, run 10000 times  
`awk '{a[$1]++}END{for(n=2;n<=12;n++)print n}' random2.txt` Every line of the file increased by one  
Print the value assoc with n:
`awk '{a[$1]++}END{for(n=2;n<=12;n++)print a[n]}' random2.txt`
    a[$1]: the bin size is going to be an integer

how many times you find this values (histogram)
awk '{a[$1]++}END{for(n=2;n<=12;n++)print n, a[n]}' random2.txt

count how many times we have added that values. count by one (++), counts how many times we are doing this operation. divide values by the count (the percentage).
´awk '{a[$1]++; count++}END{for(n=2;n<=12;n++)print a[n]/count}' random2.txt´
    n=2; first in the loop equal to two
    n<=12; as long as n is 12. stop the loop if this is not true
    n++ ; and run it for the next one  

`awk '{a[$1]++; count++}END{for(n=2;n<=12;n++)printf ("%i %.2f\n",n,a[n]/count)}' random2.txt`
  printf: allow you to control what you print
  "%i %.2f": the format that we want to use to print. print two variables %. float number
   ,n,a[n]/count: this is what I want to write.

`awk '{a[$1]++; count++}END{for(n=2;n<=12;n++)printf ("this is %i %.2f\n",n,a[n]/count)}' random2.txt` This will print the words

use a bin size different to one a general awk one liner, introducing a variable so it can be usable in other files in general:
`awk -v size=1 '{b=int($1/size); a[b]++; count++}END{for (n=2;n<=12;n++) print n*size, a[n]/count}' random2.txt`
`awk -v size=2 '{print int($1/size)}' random2.txt`
? comparison tag

  awk one liner to create histogram and put values in bins, looking at every line starting from the first:
  `awk -v size=20 'BEGIN{bmin=0;bmax=0}{b=int($1/size); a[b]++; count++; bmin= b<bmin ? b:bmin; bmax= b>bmax ? b:bmax}END{for (n=bmin;n<=bmax;n++) printf("%i %.2f\n", n*size, a[n]/count)}' random100.txt`

  change size=,
This one is when the file has the first line are headers
  ´awk -v size=20 'BEGIN{bmin=0;bmax=0}NR>1{b=int($2/size); a[b]++; count++; bmin= b<bmin ? b:bmin; bmax= b>bmax ? b:bmax}END{for (n=bmin;n<=bmax;n++) printf("%i %.2f\n", n*size, a[n]/count)}' random100.txt´

###variables
a=$(awk'BEGIN{print 4/3}')
echo {a..z} brace expansion
0..100..3 0+3, hasta 100

###for loop
for i in {1..10}; #how many times
do; #now do this everytime we do the loop
echo Hello world!;
echo ${i}; (print the numbers)
done

double redirect:

### if statements
if condition
then
command
elif (else if)
command
else
command
fi

### While/until loop
while condition
do
command
done

while: until the condition is true
until: until the condition is false

### General regular expression print Grep
`grep [string to look for] files_to_search_in` to check all the times the string appears in a particular file
$? exit status

### introduction to regular expression Regex
series of tools to match patterns, used with grep and other commands
several symbols
^$ : empty lines in a file
[anyone inside the brackets]
[^ exceptions, not the characters here]
`grep `
.* zero or more characters

### scripts
- modify permissions
`chmod +x` , +x makes the file executable. Green file is executable  
`chmod 777 script.in` modifies all the permissions, written, read and executable
- Execute the script  
`./script.in`  
- shebang
`#!/bin/bash` (where bash ex is)
if not known use `which bash` = `/bin/bash`
- Example. Is good idea to indent the cmds that are subordinate
`for i in {1..10} #count to 10
do
  if [[${i} -gt 4]]
  then
      echo it is greater than four.
    else
      echo it is not greater than four.
    fi
done`

### variables
`a=1` then everytime to refer to it use `$a` (ex. `echo $a`)
`a={10}` for two digits
`for i in {1..10}
do
  if [[${i} -gt 4]]
  then
      run some command
      if [[$? -eq 0]]
      then
          do something
      else
          do something alse`

echo $0 #name of the script  
echo $USER #who is running  
echo $SECONDS #how many seconds the file has been running, after the cmds of the file.  

`#!/bin/bash
echo $1`  
`./script.in var foo` (var and foo are the variables that can be assigned) passing variables without having to write them in the script, can use a number instead of var or foo  
`#!/bin/bash
echo var is $1
echo foo is $2`  

`nohup ./Script.in` a way of running the cmd in the background even if the window close. Output to file nohup.out   

`&` (and percent) if put after a cmd we run in the background
`nohup ./Script.in &` run the cmd in the background dont output anything in the terminal and let me go back to the terminal (&)  
`&` gives the process number which can be use to kill the process or monitor `kill #`  
`ps` to monitor processes and numbers  
`sh -x ./script.in` tells exactly what is happening in every line

- Exercise
1. Read two numbers from the cmd ln then sum them up
`#!/bin/bash
read num1
read num2
sum=$(($num1+$num2))
echo $sum
`
2. two numbers and returns the product
`#!/bin/bash
a=$1
b=$2
p=$(($a*$b))
echo ${p}`
`./script.in # #`

3. Multiply a number by 9, 10 times. It will appear in the screen 10 times
`#!/bin/bash
for i in {1..10}
do
        p=$(($1*9))
        echo $p
done`  
`./script.in #`

4. different message for everyday of the week (why this one doesn work!?)
`#!/bin/bash
day=$(date +%a)
if [[$day=="Sat"]]
  then
      echo this is day sat
elif [[$day == "Tue"]]
then
      echo this day is Tue
    ...
    ...
fi`

5. make an until loop, check if the # is divisible by 10, and count how many numbers were generated before we found the one divisible by 10
use `$RANDOM`
`#!/bin/sh
count=0
remainder=1
while [[$remainder -ne 0]]
do
  remainder=$(($RANDOM % 10))
  count=$(($count + 1))
done
echo We counted $count numbers before getting one divisible by 10`

6. Write a script to check if a submmited text has all the letters of the alphabet
    1. create text
    2. script  
    `
text=$1
  for i in {a..z}
  do
    c=$(grep -i -c $i $text)
    if [[$c -eq 0]]
    then
      echo Not all letter are found
      exit
    fi
done
echo all letters found
  `
  3. run `./script.in text.txt`

7. Write a script that takes a file as input and return the first and last line
`
text=$1
head -1 $text
tail -1 $text
`
8. How many amino acids there are in a pdb file of each type and outputs a file.
`text=$1
for i in ALA VAL ILE LEU PRO SER THR CYS MET LYS ARG ASP GLU ASN GLN PHE HIE TRP TYR GLY
do
  c=$(grep -c "CA  $i" $text)
    echo there are $c $i in this pdb >> results.txt
    done
    `
### Handling fasta files
`awk 'NR==1{print}' junk.txt` #to see the first line of the file  
`awk 'NR==2||NR==4{print}' junk.txt` #to print the line 2 and 4  
`||` "or" operator, if 2 or 4
`&&` "and" operator, implies that both conditions must be filled  
`grep -e [24] junk2.txt`

- convert DNA to RNA, change T to U
`sed 's/T/U/g' junk.txt`
------------------------
- Questions for the end of the workshop
    - Games to play with awk. No
