#!/bin/bash

NVIM_PLUG=~/.local/share/nvim/site/autoload/plug.vim
if [ ! -f "$NVIM_PLUG" ]; then
  curl -fLo $NVIM_PLUG --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Python Runtime
min_version=`python3 -c "import platform; major, minor, patch = platform.python_version_tuple(); print(major >= '3' and minor >= '6' and patch >= '1')"`&&

if [ "$min_version" != "True" ]; then    
    echo "Python 3.6.1 or Greater is Required"
    exit
fi

# Install Node Extensions
sudo npm install -g neovim instant-markdown-d || exit;

echo "Completed Successfully .."
