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
