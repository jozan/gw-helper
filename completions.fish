set -l commands ls a rm doctor

complete -c gw -f

complete -c gw -n "not __fish_seen_subcommand_from $commands" -a "a" -d "git worktree add"
complete -c gw -n "not __fish_seen_subcommand_from $commands" -a "ls" -d "git worktree list"
complete -c gw -n "not __fish_seen_subcommand_from $commands" -a "rm" -d "git worktee remove (fzf)"
complete -c gw -n "not __fish_seen_subcommand_from $commands" -a "doctor" -d "check if gw is installed correctly"

