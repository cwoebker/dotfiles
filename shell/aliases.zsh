alias reload!='. ~/.zshrc'
alias pystall='python setup.py install'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'";
alias vup="vagrant up && vagrant provision && vagrant ssh"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ${ZSH}"

# https://news.ycombinator.com/item?id=43608619
alias rsync-perfect='/usr/bin/rsync --archive --xattrs --acls --hard-links --progress --rsh="ssh -p XXX -l YYYYYYY"'
