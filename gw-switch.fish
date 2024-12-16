#!/usr/bin/env fish

function _gw-switch_print_help
    echo "usage: gw-switch"
    echo "       options:"
    echo "           -h, --help: show this message"
end

function gw-switch
    argparse h/help -- $argv
    or return

    if set -ql _flag_help
        echo "switch to a worktree in current git repository using fzf prompt"
        _gw-switch_print_help
        return 0
    end

    set -l selected_worktree (\
        git worktree list |\
        fzf \
            --preview='git log --oneline --decorate --color=always -n10 {2}' \
            --preview-window='up' \
            --prompt='worktree> ' |\
        awk '{print $1}'\
    )
    if test -z $selected_worktree
        echo "No worktree selected"
        return
    end

    echo "Worktree switched to $selected_worktree"
    cd $selected_worktree
end
