PS1='\[[$(tput setaf 33)\]\u: \[$(tput setaf 117)\]\w\[$(tput setaf 15)\]]\$ '
export PS1;

alias ampl='cd ~/AMPL; ./ampl -v;';
alias lh='ls -a | egrep "^\."'
alias config='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME';

bin () {
  echo "obase=2;$1" | bc;
}

rand() {
  echo $(($1 + $RANDOM % ($2 - $1)))
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
source "$HOME/.new_local/env"

# Prevent brew from auto-updating
export HOMEBREW_NO_AUTO_UPDATE=1

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Added for ffmpeg
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
export PATH="/usr/local/sbin:$PATH"
