alias ls="ls -FG"
alias lst="ls -FGlrt"

export EDITOR="emacs -nw"

export PATH="$HOME/bin:$PATH"

export PS1="neptune$ "
export CC=clang

export SKA=${HOME}/ska
export MICA_ARCHIVE=$SKA/data/mica/archive
export ska3conda=https://icxc.harvard.edu/aspect/ska3-conda

# This causes Ska.Shell to fail.
# export PROMPT_COMMAND='echo -ne "\033]0;`/Users/aldcroft/bin/chop_dir $PWD`\007"'

alias imagemagick='export MAGICK_HOME="$HOME/ImageMagick-6.8.9"; export PATH="$MAGICK_HOME/bin:$PATH"; export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"'

alias sa='source activate'
alias ska3='source activate ska3'
alias astropy='source activate astropy'
alias sd='source deactivate'

# added by Miniconda3 installer
export PATH="/Users/aldcroft/miniconda3/bin:$PATH"
