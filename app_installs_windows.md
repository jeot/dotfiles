# nessessary install stuff for development on a new windows machine
 
### install choco (powershell admin)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

### install scoop
# Optional: Needed to run a remote script the first time
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser 
irm get.scoop.sh | iex

### install git (powershell admin)
choco install git -y

### generate ssh key (for your new computer!)
# (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
# open git bash and run:
ssh-keygen -t ed25519 -C "sh.keshani@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
# Add the SSH key to your account on GitHub:
# (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### install gcc for windows (powershell admin)
choco install mingw
# check
g++ --version

### create a PowerShell profile (powershell admin)
Set-ExecutionPolicy Unrestricted
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
# check to have Unrestricted for LocalMachine and CurrentUser:
Get-ExecutionPolicy -List
# create file: 
"C:\Users\shk\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
# add content to this file:
Set-Alias ll Get-ChildItem
function dotfiles { git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $args }

### get the dotfiles:
git clone --bare git@github.com:jeot/dotfiles.git $HOME/.dotfiles
dotfiles checkout main -f

### install neovim (dev) (powershell admin)
choco install neovim --pre -y
# create nvim link (powershell admin)
New-Item -ItemType SymbolicLink -Path "~/AppData/Local/nvim" -Target "~/.config/nvim"
# install Packer for nvim (powershell admin)
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
# run PackerSync and quit nvim a few times
# install these LSPs (run in nvim command): LspInstall clangd cssls html jsonls sumneko_lua pyright
# download and install Mononoki Nerd Font (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip)
# install find tool
choco install fd
# install grep tool
choco install ripgrep

### install nodejs and npm
choco install nodejs

### install make
choco install make

### install python
choco install python

### install platform io
# download get-platformio.py script from https://docs.platformio.org/en/latest//core/installation.html#installation-methods
# run:
python get-platformio.py
# add to path
$Env:PATH += ";C:\Users\shk\.platformio\penv\Scripts"

### install ftdi usb-serial drivers
# download CDM from: https://www.ftdichip.com/old2020/Drivers/CDM/CDM%20v2.12.28%20WHQL%20Certified.zip
# install by using "have disk" and selecting the .ini file

### install Arm GNU Toolchain
# https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads
# AArch32 bare-metal target (arm-none-eabi)

# other useful stuff
### Install WinRAR
### Install persian fonts
### Install Synology Drive Client
### Install SublimeMerge
### Install Dropbox

### Install AutoHotKey (and paste your own script here to run at startup:)
# C:\Users\shk\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\myScript.ahk

### install windows terminal (use app store and search for it)

### install lazygit
# Add the extras bucket
scoop bucket add extras

# Install lazygit
scoop install lazygit


# Install MSYS2 64Bit
https://www.msys2.org/
