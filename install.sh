#!/bin/bash

NVIM_PLUG=~/.local/share/nvim/site/autoload/plug.vim
if [ ! -f "$NVIM_PLUG" ]; then
  curl -fLo $NVIM_PLUG --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Python Runtime
python3=`python3 -c "import sys; print(sys.executable)"`&&
min_version=`python3 -c "import platform; major, minor, patch = platform.python_version_tuple(); print(major >= '3' and minor >= '6' and patch >= '1')"`&&

if [ "$min_version" != "True" ]; then    
    echo "Python 3.6.1 or Greater is Required"
    exit
fi

# Install Python Extensions
sudo npm install -g neovim || exit;
sudo python3 -m pip install --upgrade neovim pynvim || exit;

echo "Completed Successfully .."
