function comp_bout()
{
    COMPREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]}
    local cmd=${COMP_WORDS[COMP_CWORD-1]}
    local br=`eval git branch --all --format=\"\%\(refname:short\)\"`
    br=$br" HEAD"
    if [ $COMP_CWORD -le 2 ];
    then
        COMPREPLY=( $(compgen -W '${br}' $cur))
    fi

    return 0
}
complete -F comp_bout bout