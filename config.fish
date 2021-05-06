# Greeting messenger
set -gx fish_greeting ''

# new the spaceship {{{ -----------------------
# more info https://github.com/matchai/spacefish
# Options https://github.com/matchai/spacefish/blob/master/docs/Options.metadata

set -g SPACEFISH_USER_SHOW always
set -g SPACEFISH_USER_SUFFIX "/Archv7 "
set -g SPACEFISH_DIR_TRUNC_REPO false
set -g SPACEFISH_DOCKER_SHOW false
set -g SPACEFISH_KUBECONTEXT_SHOW false
set -g SPACEFISH_CONDA_SHOW false
set -g SPACEFISH_CHAR_SYMBOL " "


# }}} -----------------------------------------

# ############################{{{{{ -----------
# # setting theme bobthefish
# # More info https://github.com/oh-my-fish/theme-bobthefish
#
# #set -g theme_display_git no
# #set -g theme_display_git_dirty no
# #set -g theme_display_git_untracked no
# #set -g theme_display_git_ahead_verbose yes
# #set -g theme_display_git_dirty_verbose yes
# #set -g theme_display_git_stashed_verbose yes
# #set -g theme_display_git_master_branch yes
# #set -g theme_git_worktree_support yes
# #set -g theme_use_abbreviated_branch_name yes
# #set -g theme_display_vagrant yes
# #set -g theme_display_docker_machine no
# #set -g theme_display_k8s_context yes
# #set -g theme_display_hg yes
# #set -g theme_display_virtualenv no
# #set -g theme_display_nix no
# #set -g theme_display_ruby no
# #set -g theme_display_nvm yes
# set -g theme_display_user ssh
# #set -g theme_display_hostname ssh
# # set -g theme_display_vi no
# set -g theme_display_date no
# #set -g theme_display_cmd_duration yes
# #set -g theme_title_display_process yes
# #set -g theme_title_display_path no
# #set -g theme_title_display_user yes
# #set -g theme_title_use_abbreviated_path no
# #set -g theme_date_format "+%a %H:%M"
# #set -g theme_date_timezone America/Los_Angeles
# #set -g theme_avoid_ambiguous_glyphs yes
# #set -g theme_powerline_fonts no
# #set -g theme_nerd_fonts yes
# #set -g theme_show_exit_status yes
# #set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
# #set -g theme_color_scheme dark
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes
# set -g theme_newline_prompt '$ '
#
# }}}}} ---------------------------------------

# Docker 
alias docker='docker.exe'
# Missing typo vim <-> nvim
alias vim='nvim'
# Usually 'function rf' in terminal 
#alias reloadfish='source ~/.config/fish/config.fish'
# Use for managent dotfiles, but I no longer use this
#alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ll='exa -l'

#######
# WSL (Windows Subsystem for Linux) specific settings.

# if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
#   # Adjustments for WSL's file / folder permission metadata.
#   if [ "$(umask)" = "0000"  ]; then
#     umask 0022
#   fi
#
#   # Access local X-server with VcXsrv.
#   #   Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
#   export DISPLAY=:0
#
#   # Configure the Docker CLI to use the Docker for Windows daemon.
#   #   Requires: https://docs.docker.com/docker-for-windows/install/
#   export DOCKER_HOST=tcp://localhost:2375
#
# fi
#
export DOCKER_HOST=tcp://localhost:2375

## Useful functions {{{-----------------------


function ef; nvim ~/.config/fish/config.fish; end
function rf; source ~/.config/fish/config.fish && echo 'reload config.fish DONE!!!'; end
function et; nvim ~/.tmux.conf; end
function ev; nvim ~/.config/nvim/init.vim; end
#function rv; source ~/.config/nvim/init.vim && echo 'reload Nvim Config DONE!!!'; end
function eg; nvim ~/.gitconfig; end
function ea; nvim /mnt/c/Users/Administrator/AppData/Roaming/alacritty/alacritty.yml; end
function sshtestgit; ssh -T git@github.com; end



# ---
# Config ssh
# ssh-keygen -t rsa -b 4096 -C "hoang.lduc@gmail.com"
#function essh; nvim ~/.ssh/config; end
# ---

# ---
# Add editorconfig to project
function addeditorconfig; wget https://raw.githubusercontent.com/pantasio/dotfiles/master/.editorconfig; end
# ---


function vimwiki; nvim /mnt/d/Workspace/cli-help/index.wiki; end
function vimtemp; nvim /mnt/t/Workspace/cli-help/Vimwiki/template.txt; end

function retmux; pgrep -vx tmux > /dev/null && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach; end 

#function ed; vim ~/.vim/custom-dictionary.utf-8.add; end
#function ef; vim ~/.config/fish/config.fish; end
#function eff; vim ~/.config/fish/functions; end
#function eh; vim ~/.hgrc; end
#function ei; vim ~/Dropbox/inventory.markdown; end
#function ek; vim ~/lib/dotfiles/keymando/keymandorc.rb; end
#function em; vim ~/.mutt/muttrc; end
#function ep; vim ~/.pentadactylrc; end

function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

# ---
# List the last modified files in a directory with subdirectories and times.
#find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head

# To find all files that file status was last changed N minutes ago. Example 5min ago
#find -cmin -5
# ---


#------------------------------------------------}}}


# Help document {{{
#
# 1. Fish Shelp
# TODO use vimwiki

  function helpf; nvim /mnt/d/cli-help/Fish/README.md; end
  function helpv; nvim /mnt/d/cli-help/Nvim/README.md; end
  function helpt; nvim /mnt/d/cli-help/Tmux/README.md; end
  function helpg; nvim /mnt/d/cli-help/Git/README.md; end

## }}}

## Setting pyenv {{{
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
#}}}

# ENV {{{
# setting ansible path after install Ansible with pip
set  PATH /home/bungbu/.local/bin/ $PATH

# }}}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/bungbu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
cd ~
