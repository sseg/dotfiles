# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/fish/{path,exports,aliases,abbrs,extra};
    [ -r "$file" ] ; and [ -f "$file" ]; and . "$file"
end
set -e file

set SHELL /usr/local/bin/fish
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡ '
set __fish_git_prompt_char_stagedstate '→ '
set __fish_git_prompt_char_untrackedfiles '☡ '
set __fish_git_prompt_char_stashstate '↩ '
set __fish_git_prompt_char_upstream_ahead '+ '
set __fish_git_prompt_char_upstream_behind '- '

# More colors
set fish_color_command purple 

# Prompt

function pew_prompt
    if [ -n "$VIRTUAL_ENV" ]
        echo -n (set_color --bold white) (basename "$VIRTUAL_ENV") (set_color normal)" "
    end
end

function fish_prompt
  set last_status $status
  pew_prompt
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

function c
  cd $argv
  ls -lG
end

# pyenv
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

set -g fish_user_paths "/usr/local/bin" $fish_user_paths
