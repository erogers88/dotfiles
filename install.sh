#!/bin/sh

# Get script directory
SCRIPTDIR="$(dirname "$(realpath "$0")")"

# Personal or Work?
read_char() {
  echo "Configure personal or work email account [p/w]?"
  stty -icanon -echo
  eval "$1=\$(dd bs=1 count=1 2>/dev/null)"
  stty icanon echo
}
read_char PORW

if [ "$PORW" = "p" ]; then
	ACCNAME="personal"
elif [ "$PORW" = "w" ]; then
	ACCNAME="work"
else echo "Response not recognized, aborting..." && exit
fi

# Desktop or Laptop?
read_char() {
  echo "Is this a desktop or laptop [d/l]?"
  stty -icanon -echo
  eval "$1=\$(dd bs=1 count=1 2>/dev/null)"
  stty icanon echo
}
read_char DORL

if [ "$DORL" = "d" ]; then
	PHYSTYPE="desktop"
elif [ "$DORL" = "l" ]; then
	PHYSTYPE="laptop"
else echo "Response not recognized, aborting..." && exit
fi

# Remove any existing nvim files
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"
rm -rf "$HOME/.cache/nvim"

# Remove neomutt files
rm -rf "$HOME/.cache/neomutt"

# Make directories if needed
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/neomutt"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/vdirsyncer"
mkdir -p "$HOME/.config/khard"
mkdir -p "$HOME/.config/hypr"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/gtk-4.0"
mkdir -p "$HOME/.ssh"
mkdir -p "$HOME/.npm-global/bin"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/Maildir/personal"
mkdir -p "$HOME/Maildir/work"
mkdir -p "$HOME/.gnupg"
mkdir -p "$HOME/.calendars/personal"
mkdir -p "$HOME/.calendars/work"
mkdir -p "$HOME/.contacts/personal"
mkdir -p "$HOME/.contacts/work"

# Account-specific
cp "$SCRIPTDIR/.config/neomutt/accounts.$ACCNAME" "$HOME/.config/neomutt/accounts"
cp "$SCRIPTDIR/.config/neomutt/mailcap.$ACCNAME" "$HOME/.config/neomutt/mailcap"
cp "$SCRIPTDIR/.config/vdirsyncer/config.$ACCNAME" "$HOME/.config/vdirsyncer/config"
cp "$SCRIPTDIR/.config/khard/khard.conf.$ACCNAME" "$HOME/.config/khard/khard.conf"
cp "$SCRIPTDIR/.notmuch-config.$ACCNAME" "$HOME/.notmuch-config"
cp "$SCRIPTDIR/.gitconfig.$ACCNAME" "$HOME/.gitconfig"
cp "$SCRIPTDIR/.config/hypr/hyprland.conf.$PHYSTYPE" "$HOME/.config/hypr/hyprland.conf"

# Copy all config files
cp -r "$SCRIPTDIR/.config/"* "$HOME/.config"
cp -r "$SCRIPTDIR/.ssh/"* "$HOME/.ssh"
cp "$SCRIPTDIR/.aliases" "$HOME"
cp "$SCRIPTDIR/.bashrc" "$HOME"
cp "$SCRIPTDIR/.profile" "$HOME"
cp "$SCRIPTDIR/.tmux.conf" "$HOME"
cp "$SCRIPTDIR/.mbsyncrc" "$HOME"
cp "$SCRIPTDIR/.msmtprc" "$HOME"
cp "$SCRIPTDIR/.gnupg/gpg.conf" "$HOME/.gnupg/gpg.conf"
cp "$SCRIPTDIR/.gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
cp "$SCRIPTDIR/.pandoc-styling.css" "$HOME/.pandoc-styling.css"
cp "$SCRIPTDIR/.vimrc" "$HOME/.vimrc"
cp "$SCRIPTDIR/.davmail.properties" "$HOME/.davmail.properties"

# Detect Windows and Copy Windows-Specific configs
UNAME="$(uname -a)"
if echo "$UNAME" | grep -i 'microsoft'; then
	if [ -z "$USERPROFILE" ]; then
		eval "/mnt/c/Windows/system32/cmd.exe /c setx WSLENV USERPROFILE/up"
		echo "Restart WSL to reset environment variables and rerun script"
		exit
	fi

	# alacritty
	mkdir -p "$USERPROFILE/AppData/Roaming/alacritty"
	cp "$SCRIPTDIR/wsl/alacritty-wsl.toml" "$USERPROFILE/AppData/Roaming/alacritty/alacritty.toml"

	# komorebi
	cp "$SCRIPTDIR/wsl/komorebi.ahk" "$USERPROFILE/komorebi.ahk"
	cp "$SCRIPTDIR/wsl/komorebi.json" "$USERPROFILE/komorebi.json"

	# glazewm
	mkdir -p "$USERPROFILE/.glzr/glazewm"
	cp "$SCRIPTDIR/wsl/glazewm-config.yaml" "$USERPROFILE/.glzr/glazewm/config.yaml"

	# node fix for musl-based system (check for apk program)
	if [ "$(apk --version >/dev/null 2>&1)" = "0" ]; then
		cp "$SCRIPTDIR/wsl/node" "$HOME/.local/bin"
	fi

	# add BROWSER variable
	printf "\nexport BROWSER=/usr/local/bin/chromium\n" >> "$HOME/.bashrc"
	
fi

echo "Success"

if [ ! -f "$HOME/.msmtppass.gpg" ]; then
	echo "create ~/.msmtppass.gpg using gpg to encrypt mail IMAP/SMTP password, if it doesn't exist"
fi

if [ ! -f "$HOME/.davpass.gpg" ]; then
	echo "create ~/.davpass.gpg using gpg to encrypt caldav/carddav password, if it doesn't exist"
fi

echo "run 'mbsync [personal | work] before using neomutt if you haven't on this machine yet"
echo "run 'vdirsyncer discover' and 'vdirsyncer sync' to sync calendars and contacts"
