#!/bin/bash

now=`pwd`

conf_path=~/.config
nvim_path=${conf_path}/nvim
if [ -d ${conf_path} ]
then
  rm -rf ${conf_path}
fi
mkdir -p ${conf_path}
ln -sf ${now}/nvim ${conf_path}/
ln -sf ${now}/.zshrc ~/.zshrc
ln -sf ${now}/.tmux.conf ~/.tmux.conf
