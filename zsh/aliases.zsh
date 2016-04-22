# Inline alias
alias -g A='| ag'              # Pipe to ag
alias -g G='| grep'            # Pipe to grep
alias -g H='| head'            # Pipe to head
alias -g L="| less"            # Pipe to less
alias -g LA="2>&1 | less"      # Pipe everything to less
alias -g NA="> /dev/null 2>&1" # Redirect everything to null
alias -g NE="2> /dev/null"     # Redirect error to null
alias -g RE="2>&1"             # Redirect error to stdout
alias -g T='| tail'            # Pipe to tail

