#!/bin/sh
set -eu
RALLY=rally
VERSION=0.0.1
TARGET=$(ls -d  ~/* ~/* | fzf)
NAME=$(basename $TARGET)
smug start $NAME -a 2>/dev/null || smug start default name=$NAME root=$TARGET -a
