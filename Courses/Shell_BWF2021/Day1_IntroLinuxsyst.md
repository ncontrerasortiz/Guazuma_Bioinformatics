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
