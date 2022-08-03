#!/bin/sh
set -eu
RALLY=rally
VERSION=0.0.1
TARGET=$(ls -d  ~/dotfiles ~/desktop/* ~/desktop/gh/* ~/* | fzf)
NAME=$(basename $TARGET)
tmuxinator start $NAME || tmuxinator start default name=$NAME root=$TARGET
