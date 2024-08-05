#### sc completion
function comp_sc()
{
    COMPREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]}
    local cmd=${COMP_WORDS[COMP_CWORD-1]}

    case $cmd in
    'sc')
        COMPREPLY=( $(compgen -W 'base build rebuild' $cur ) )
    ;;

    'base')
        work_space_path="${HOME}/works/sylixos-workspace"
        bases=""
        for item in $work_space_path/bases/*; do
            temp=${item##*/}
            bases=$bases" ${temp}"
        done

        COMPREPLY=( $(compgen -W '${bases}' $cur ) )
    ;;

    esac

    return 0
}
complete -F comp_sc sc
#### sc completion end
