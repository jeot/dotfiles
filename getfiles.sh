# copy original files to this directory

# my own bash
cp ~/shk_startup.sh ./shk_startup.sh

# the .vimrc file
cp ~/.vimrc ./.vimrc

# the .bashrc & .profile
cp ~/.bashrc ./.bashrc
cp ~/.profile ./.profile

# the tmux configuration
cp ~/.tmux.conf ./.tmux.conf

# the i3 config files
mkdir -p -v .config/i3
cp ~/.config/i3/config ./.config/i3/config
cp ~/.config/i3/i3blocks.conf ./.config/i3/i3blocks.conf

# the coc configuration file
mkdir -p -v .vim
cp ~/.vim/coc.vim ./.vim/coc.vim
cp ~/.vim/coc-settings.json ./.vim/coc-settings.json

# the keybindings
cp ~/.xbindkeysrc ./.xbindkeysrc

# the keybindings
cp ~/app_installs.md ./app_installs.md
