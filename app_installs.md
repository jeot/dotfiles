# install curl
sudo apt install curl

# install tmux (and plugin manager)
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# press previx I to reload (Cntr-Space I)

# install vim with clipboard feature (vim don't enable that)
sudo apt-get install vim-gtk3 -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# run :PlugInstall

####################
### From here you should be able to send commands in TMUX pane using <leader>ee from VIM

# git
sudo apt install git 
git config --global core.pager "less -x1,5"
git config --global user.email "sh.keshani@gmail.com"
git config --global user.name "Shamim Keshani"

# xclip (for copy to clipboard)
sudo apt-get install xclip -y

# make
sudo apt install make -y

### install platform io
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -o get-platformio.py
sudo apt install python3-venv -y
python3 get-platformio.py

# install the latest nodejs & npm
# https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install nodejs -y

# then add this line in your ~/.profile
export PATH=$PATH:~/.platformio/penv/bin

# add your user to tty and dialout groups
sudo adduser shk dialout
sudo adduser shk tty

# install dotnet (.NET Core)
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-6.0

# instal starship (the pretty terminal command prompt)
# (edit .bashrc, add following line to end of file)
# eval "$(starship init bash)"
sudo snap install starship

# VIFM file manager
sudo apt install vifm -y

# install gnome-tweaks
sudo apt install gnome-tweaks -y

# install tools for binding mouse and keyboard keys
sudo apt install xbindkeys x11-utils xdotool -y

# video codecs
sudo apt install ubuntu-restricted-extras -y

# gnome clocks (world clocks/alarms/stopwatch/timer)
sudo apt install gnome-clocks -y

# install sublime merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-merge

# install photo editor app like MS Paint
sudo snap install pinta

################ optional (do we really need them?)

# remove ubuntu duck
sudo apt remove gnome-shell-extension-ubuntu-dock

# install ubuntu duck
sudo apt install gnome-shell-extension-ubuntu-dock

# install wireguard
sudo apt install wireguard -y
sudo ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf

# install imagemagick
sudo apt-get install imagemagick -y
