#!/bin/zsh

# chsh -s $(which zsh)
# https://github.com/chriskempson/base16-iterm2

link_files () {
  for name in *; do
    target="$1$name"
    if [ -e "$target" ]; then
      if [ ! -L "$target" ]; then
        echo "\e[0;31mWARNING:\e[0m $target exists but is not a symlink."
      fi
    else
      echo "\e[0;34mCreating \e[0m $target"
      ln -s "$PWD/$name" "$target"
    fi
  done
}

cd conf
link_files "$HOME/."

echo  '\e[0;32m'All installed'\e[0m'
