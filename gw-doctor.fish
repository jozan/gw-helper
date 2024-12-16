#!/usr/bin/env fish

function _gw-doctor_print_help
    echo "usage: gw-doctor"
    echo "       options:"
    echo "           -h, --help: show this message"
end

function gw-doctor
    argparse h/help -- $argv
    or return

    if set -ql _flag_help
        echo "health check for this git worktree helper"
        _gw-doctor_print_help
        return 0
    end

    set -f needs_doctor false

    for cmd in "git" "fzf" "awk" "rg"
        set -f msg "Checking for $cmd..."
        if not command -sq $cmd
            set -f msg "$msg Error: not found."
            set -f needs_doctor true
        else
            set -f msg "$msg OK."
        end

        echo $msg
    end

    echo "" # i'm a newline

    if test $needs_doctor = true
        echo "Please install the missing dependencies."
        return 1
    end

    echo "All OK :-)"
    return 0
end

