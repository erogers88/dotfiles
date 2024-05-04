#!/bin/sh

sudo apk add \
	neovim \
	neomutt \
	isync \
	msmtp \
	urlscan \
	w3m \
	khal \
	vdirsyncer \

# khard not available on apk
pip install khard
