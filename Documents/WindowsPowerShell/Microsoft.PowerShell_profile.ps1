Set-Alias ll Get-ChildItem
function dotfiles { git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $args }
