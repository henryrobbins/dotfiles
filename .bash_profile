# .bash_profile

# Same as non-interactive shell
if [ -f .bashrc ]; then
	. .bashrc
fi

# AMPL commands to run upon start
export OPTIONS_IN=~/AMPL/OPTIONS_IN;
export GUROBI_HOME="/Library/gurobi902/mac64"

# SCIP opt suite
# export SCIPOPTDIR=~/Applications/SCIPOptSuite-7.0.2-Darwin;

# Update your path to include LaTeX for TAs
export PATH=${PATH}:/usr/texbin

# Kivy settings for preferences and logging
export KIVY_HOME="${HOME}/.kivy"

# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/opt/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

##
# Your previous /Users/Henry/.bash_profile file was backed up as /Users/Henry/.bash_profile.macports-saved_2020-05-29_at_12:38:20
##

# MacPorts Installer addition on 2020-05-29_at_12:38:20: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# opam configuration
test -r $HOME.opam/opam-init/init.sh && . /Users/Henry/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/3.0.0/bin:$PATH
source "$HOME/.new_local/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

