# Defined in /tmp/fish.DBTHin/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l suffix
    set -l git_br
    set git_br (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s (set_color brblack) "(" (date +'%b %-m, %-I:%M:%S %p)-') (set_color red) "$USER" @ (prompt_hostname) (set_color brblack) ':' (set_color $color_cwd) (prompt_pwd) ' ' (set_color -d cyan) "$git_br" (set_color green) \n"$suffix " (set_color normal)
end
