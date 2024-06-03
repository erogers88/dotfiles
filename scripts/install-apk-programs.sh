#!/bin/sh

sudo apk add \
	neovim \
	python3 \
	py3-pynvim \
	py3-pip \
	neomutt \
	isync \
	msmtp \
	urlscan \
	w3m \
	vdirsyncer \
	py3-icalendar \
	notmuch \
	calcurse \
	py3-beautifulsoup4 \

pip install --user khard
pip install --user css-inline
pip install --user mutt-html-reply
