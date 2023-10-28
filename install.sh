#!/bin/sh

REPODIR="$(dirname "$(realpath "$0")")"

# Remove any existing Neovim configs and state
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"

# Make directories if needed
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.ssh"
mkdir -p "$HOME/.npm-global/bin"
mkdir -p "$HOME/.local/bin"

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

	# node fix for musl-based system (check for apk program)
	if [ "$(apk --version >/dev/null 2>&1)" = "0" ]; then
		cp "$REPODIR/wsl/node" "$HOME/local/bin"
	fi
	
fi
