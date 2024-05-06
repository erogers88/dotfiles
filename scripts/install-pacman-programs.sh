#!/bin/sh

sudo pacman -S \
	neovim \
	neomutt \
	isync \
	msmtp \
	urlscan \
	w3m \
	khal \
	khard \
	vdirsyncer \

pip install --user python-icalendar
