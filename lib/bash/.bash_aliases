# Linux aliases
alias ftoday='find -maxdepth 1 -type f -mtime -1' # Find today's file

# some aliases
alias ac='less ~/.ssh/config | grep Host'
alias al='view ~/.bash_aliases'
alias du1='du -h --max-depth=1 .'

# -----------------------
# HPC system alias
# ----------------------
alias ll='ls -lF -h'
alias mysq='squeue --format="%.18i %.9A %.9P %.8j %.8u %.2t %.10M %C %m %g"'
alias srun1='srun --nodes=1 --mem 1024 --ntasks=1 --licenses=common --time=8:00:00 --pty bash'
alias srun4='srun --nodes=1 --mem 4G --ntasks=4 --licenses=common --time=8:00:00 --pty bash'
alias srunq4='srun --qos=short --nodes=1 --licenses=common --ntasks=4 --mem 32G --time 6:00:00 --pty bash'
alias srunq1="srun --qos=short --nodes=1 --licenses=common --ntasks-per-node=1 --mem-per-cpu=1024 --time 6:00:00 --pty $SHELL"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
#alias squeue='squeue --format="%.12i %.0P %.18j %.8u %.2t %.10M %C %R"'


#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

#alias tar='tar -zxvf'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
#alias less='less -FSRXc'                    # Preferred 'less' implementation
#cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
#alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'






