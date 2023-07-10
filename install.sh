#!/bin/sh

REPODIR="$(dirname "$(realpath "$0")")"

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

# Detect Windows and Copy Windows-Specific configs
UNAME="$(uname -a)"
if echo "$UNAME" | grep 'Microsoft'; then
	if [ -z "$USERPROFILE" ]; then
		eval "/mnt/c/Windows/system32/cmd.exe /c setx WSLENV USERPROFILE/up"
		echo "Restart WSL to reset environment variables and rerun script"
		exit
	fi

	# alacritty
	mkdir -p "$USERPROFILE/AppData/alacritty"
	cp "$REPODIR/wsl/alacritty-wsl.yml" "$USERPROFILE/AppData/Roaming/alacritty/alacritty.yml"
fi
