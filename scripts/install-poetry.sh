#!/usr/bin/env bash

# set -x  # enable for verbose output
set -e # failing commands cause the shell script to exit immediately

function help_() { # don't shadow help-builtin
    echo "Steps:"
    echo "    1) install poetry"
    echo "    2) syminl poetry-executable:"
    echo "    3) update poetry"
    echo "    4) install extensions"
    exit
}

function install_poetry() {
    echo -e "Installing poetry."
    curl -sSL https://install.python-poetry.org | python3 -
}

function symlink_poetry() {
    echo -e "Symlinking poetry-executable to ~/bin/poetry."
    cd ~/bin && ln -s ~/.local/share/pypoetry/venv/bin/poetry poetry && cd -
}

function update_poetry() {
    echo -e "Updating poetry itself."
    poetry self update
}

function install_extensions() {
    # https://github.com/madkinsz/poetry-relax
    echo -e "Installing poetry-plugin: poetry-relax."
    poetry self add poetry-relax

    # see https://github.com/python-poetry/poetry-plugin-export
    echo -e "Installing poetry-plugin: poetry-plugin-export."
    poetry self add poetry-plugin-export

    # see https://pypi.org/project/poetry-dynamic-versioning/
    echo -e "Installing poetry-plugin: poetry-dynamic-versioning."
    poetry self add "poetry-dynamic-versioning[plugin]"

}

# main program
install_poetry
symlink_poetry
update_poetry
install_extensions
