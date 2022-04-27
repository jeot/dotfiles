# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include platformio binaries
if [ -d "$HOME/.platformio/penv/bin" ] ; then
    PATH="$HOME/.platformio/penv/bin:$PATH"
fi

# include arm compiler toolchain
if [ -d "$HOME/arm/gcc-arm-none-eabi-10.3-2021.10/bin" ] ; then
	PATH="$PATH:$HOME/arm/gcc-arm-none-eabi-10.3-2021.10/bin"
fi

# include the clangd installed by nvim-lsp-installer
if [ -d "$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin" ] ; then
	PATH="$PATH:$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin"
fi
