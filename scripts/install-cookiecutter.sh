#!/usr/bin/env bash

# set -x  # enable for verbose output
set -e # failing commands cause the shell script to exit immediately

#      curl -sSL https://install.python-poetry.org | python3 -

NOW=$(date +"%Y-%m-%d %H:%M:S")

function help_() { # don't shadow help-builtin
    echo "Steps:"
    echo "    1) install virtualenv"
    echo "    1) upgrade pip"
    echo "    1) install cookiecutter"
    echo "    2) symlink cookiecutter-executable into ~/bin:"
    exit
}

function update_pip() {
    echo -e "Updating pip."
    pip install -U pip
}

function install_cookiecutter() {
    echo -e "Installing cookiecutter."
    pip install cookiecutter
}

function symlink_poetry() {
    echo -e "Symlinking cookiecutter-executable to ~/bin/cookiecutter."
    cd ~/bin && ln -s ~/.local/share/pypoetry/venv/bin/poetry poetry && cd -
}

# main program
update_pip
install_cookiecutter
symlink_cookiecutter
