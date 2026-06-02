fish_config theme choose catppuccin-mocha

# ---------------- Core Editor Setup ------------- #
if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    # set -gx MANPAGER 'nvim +Man!'
    set -gx MANWIDTH 999
else if type -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
end

# ------------------------------------------------ #

# Homebrew - Command Not Found
set HOMEBREW_COMMAND_NOT_FOUND_HANDLER (brew --repository)/Library/Homebrew/command-not-found/handler.fish
if test -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
    source $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
end

# -------------- FZF Setup ------------------- #

fish_add_path /Applications/
fish_add_path "$HOME/go/bin/"
fish_add_path /opt/homebrew/bin/
fish_add_path --move --prepend "$HOME/.local/bin/"

fzf --fish | source
zoxide init fish | source
starship init fish | source
atuin init fish | source
tv init fish | source
direnv hook fish | source

# claurst
fish_add_path /Users/dom/.claurst/bin

# ticky shell integration
function fish_right_prompt
    ticky --status
end

# Set TMUX_DIR for tmux configuration
set -gx TMUX_DIR /Users/dom/.config/tmux
