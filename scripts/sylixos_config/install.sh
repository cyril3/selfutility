#!/usr/bin/env bash

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)
config_path_dest="${HOME}/.config/sc/buildinfo.json"
config_path_src="${script_dir}/buildinfo.json"

sudo cp -vf $script_dir/sc /usr/bin
sudo chmod -v +x /usr/bin/sc

if [ ! -f ${HOME}/.config/sc/buildinfo.json ]; then
    echo "{\"bsp_list\":[]}" > ${HOME}/.config/sc/buildinfo.json
fi

bsp_list=$(jq -c ".bsp_list[].name" $config_path_src | sed 's/"//g')         #list all bsp names from src
bsp_dest=$(cat $config_path_dest)
for v in $bsp_list; do
    findbsp=$(echo $bsp_dest | jq -c ".bsp_list[] | select(.name==\"${v}\")")
    if [ -z "$findbsp" ]; then              #find bsp from dest config
        add_str=$(jq -c ".bsp_list[] | select(.name==\"${v}\")" $config_path_src)
        bsp_dest=$(echo $bsp_dest | jq -c ".bsp_list += [$add_str]")
    fi
done

echo $bsp_dest > $config_path_dest

touch ${HOME}/.bash_completion

base_path=$(sed -n "/sc completion/p" ${HOME}/.bash_completion)

if [ -z "$base_path" ]; then
    cat $script_dir/sc_comp.sh >> ${HOME}/.bash_completion
fi
