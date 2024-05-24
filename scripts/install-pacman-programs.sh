#!/bin/sh

sudo pacman -S \
	neovim \
	python \
	python-pynvim \
	neomutt \
	isync \
	msmtp \
	urlscan \
	w3m \
	vdirsyncer \
	python-icalendar \
	notmuch \
	calcurse \
	khard \
	python-beautifulsoup4 \

pip install --user css-inline
pip install --user mutt-html-reply
