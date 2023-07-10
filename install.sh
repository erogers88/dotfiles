#!/bin/sh

REPODIR="$(dirname "$(realpath "$0")")"

# Detect Windows and Copy Windows-Specific configs
UNAME="$(uname -a)"
if echo "$UNAME" | grep 'Microsoft'; then
	WINDOWSUSER="/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe '$env:UserName'"
	WINDOWSHOME="/mnt/c/Users/$WINDOWSUSER"

	# alacritty
	mkdir -p "$WINDOWSHOME/AppData/alacritty"
	cp "$REPODIR/wsl/alacritty-wsl.yml" "$WINDOWSHOME/AppData/alacritty/alacritty.yml"
fi

# Make directories if needed
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.ssh"

# Copy all config files
cp -r "$REPODIR/.config/"* "$HOME/.config"
cp -r "$REPODIR/.ssh/"* "$HOME/.ssh"
cp "$REPODIR/.aliases" "$HOME"
cp "$REPODIR/.bashrc" "$HOME"
cp "$REPODIR/.profile" "$HOME"
cp "$REPODIR/.tmux.conf" "$HOME"
