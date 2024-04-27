#!/bin/sh

# Get script directory
SCRIPTDIR="$(dirname "$(realpath "$0")")"

# Remove any existing nvim files
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"

# Make directories if needed
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.ssh"
mkdir -p "$HOME/.npm-global/bin"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/Maildir/personal"
mkdir -p "$HOME/Maildir/work"

# Copy all config files
cp -r "$SCRIPTDIR/.config/"* "$HOME/.config"
cp -r "$SCRIPTDIR/.ssh/"* "$HOME/.ssh"
cp "$SCRIPTDIR/.aliases" "$HOME"
cp "$SCRIPTDIR/.bashrc" "$HOME"
cp "$SCRIPTDIR/.profile" "$HOME"
cp "$SCRIPTDIR/.tmux.conf" "$HOME"
cp "$SCRIPTDIR/.mbsyncrc" "$HOME"
cp "$SCRIPTDIR/.msmtprc" "$HOME"

echo "copy ~/.config/neomutt/accounts.<personal | work> to ~/.config/neomutt/accounts"
echo "create ~/.msmtppass.gpg using gpg to encrypt password"

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
	cp "$SCRIPTDIR/wsl/alacritty-wsl.yml" "$USERPROFILE/AppData/Roaming/alacritty/alacritty.yml"

	# node fix for musl-based system (check for apk program)
	if [ "$(apk --version >/dev/null 2>&1)" = "0" ]; then
		cp "$SCRIPTDIR/wsl/node" "$HOME/.local/bin"
	fi
	
fi

