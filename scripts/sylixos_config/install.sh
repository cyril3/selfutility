#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

sudo cp -vf $SCRIPT_DIR/sc /usr/bin
sudo chmod -v +x /usr/bin/sc

touch ${HOME}/.bash_completion

base_path=$(sed -n "/sc completion/p" ${HOME}/.bash_completion)

if [ -z "$base_path" ]; then
    cat $SCRIPT_DIR/sc_comp.sh >> ${HOME}/.bash_completion
fi
