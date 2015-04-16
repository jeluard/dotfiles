#!/bin/zsh

# Install vundle with git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "\e[0;31mWARNING:\e[0m $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "\e[0;34mCreating \e[0m $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

vim +BundleInstall! +qa

echo  '\e[0;32m'All installed'\e[0m'
