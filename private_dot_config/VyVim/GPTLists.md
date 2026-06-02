eza \
bat \
fd \
ripgrep \
fzf \
zoxide \
starship \
neovim \
tmux \
sqlite \
jq \
yq \
httpie \
glow \
lazygit \
git-delta \
direnv \
atuin \
btop \
dust \
duf \
tldr \
tealdeer \
entr \
uv \
pyenv \
pipx \
tree \
wget


'Best fish plugins'
fisher install \
    IlanCosman/tide \
    PatrickF1/fzf.fish \
    jethrokuan/z \
    gazorby/fish-abbreviation-tips \
    catppuccin/fish \
    meaningful-ooo/sponge \
    franciscolourenco/done

    Tide	Stunning prompt
    fzf.fish	Interactive fuzzy completion
    z	Smart directory jumps
    abbreviation-tips	Learns your aliases
    catppuccin/fish	Theme
    sponge	Reloads env after installs
    done	Notifications for long commands


Potential Config:
```
# Disable greeting
set -U fish_greeting

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Catppuccin
fish_config theme choose "Catppuccin Mocha"

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.npm-global/bin

# UV / Python
set -gx UV_SYSTEM_PYTHON 1

# Better manpages
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# FZF
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Bat theme
set -gx BAT_THEME "Catppuccin Mocha"

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# Direnv
direnv hook fish | source

# Atuin
atuin init fish | source
```

abbr --add flaskrun 'flask --app app run --debug'
abbr --add flaskshell 'flask shell'
abbr --add routes 'flask routes'

abbr --add venv 'uv venv'
abbr --add act 'source .venv/bin/activate.fish'
abbr --add py 'python3'
abbr --add pip 'uv pip'
abbr --add pytest 'python -m pytest'
abbr --add ruff 'python -m ruff'

abbr --add .. 'cd ..'
abbr --add ... 'cd ../..'
abbr --add .... 'cd ../../..'
abbr --add home 'cd ~'
abbr --add c 'clear'

function flask-init
    mkdir -p $argv[1]
    cd $argv[1]

    uv venv
    source .venv/bin/activate.fish

    uv pip install flask python-dotenv

    mkdir templates static

    touch app.py .env .gitignore

    echo "FLASK_APP=app.py" >> .env
    echo ".venv/" >> .gitignore

    printf '%s\n' \
'from flask import Flask' \
'' \
'app = Flask(__name__)' \
'' \
'@app.route("/")' \
'def home():' \
'    return "<h1>Hello Flask</h1>"' \
'' \
'if __name__ == "__main__":' \
'    app.run(debug=True)' > app.py

    echo "Flask app initialized."
end


abbr --add sqlite 'sqlite3 -column -header'

function sqltables
    sqlite3 $argv[1] ".tables"
end

function schema
    sqlite3 $argv[1] ".schema"
end


abbr --add serve 'python -m http.server 8000'

abbr --add ni 'npm install'
abbr --add nid 'npm install --save-dev'
abbr --add nr 'npm run'
abbr --add ns 'npm start'
abbr --add nv 'npm run dev'



