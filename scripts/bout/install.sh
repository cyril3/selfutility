#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

sudo cp -vf $SCRIPT_DIR/bout /usr/bin
sudo chmod -v +x /usr/bin/bout

touch -v ${HOME}/.bash_completion

base_path=$(sed -n "/bout completion/p" ${HOME}/.bash_completion)

if [ -z "$base_path" ]; then
    cat $SCRIPT_DIR/bout_comp.sh >> ${HOME}/.bash_completion
fi
