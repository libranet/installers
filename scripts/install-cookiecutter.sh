#!/usr/bin/env bash

# set -x  # enable for verbose output
set -e # failing commands cause the shell script to exit immediately


NOW=$(date +"%Y-%m-%d %H:%M:S")

# INSTALL_DIR=$(realpath -s "$1")
INSTALL_DIR=${1:-/opt/tools/cookiecutter}
BIN_DIR=${INSTALL_DIR}/bin

# get parameters from the input
# ENV_NAME=${1:.venv}
PYTHON_VERSION=${2:-3.11}   # set default python-version to 3.11


function help_() { # don't shadow help-builtin
    echo "Steps:"
    echo "    1) install virtualenv"
    echo "    1) upgrade pip"
    echo "    1) install cookiecutter"
    echo "    2) symlink cookiecutter-executable into ~/bin:"
    exit
}

function create_venv() {
    echo -e "Create venv in ${INSTALL_DIR}"
    mkdir -p ${INSTALL_DIR}
    # PYENV_VERSION=${PYTHON_VERSION} python -m venv "$ENV_NAME"
    PYENV_VERSION=${PYTHON_VERSION} python -m venv "$INSTALL_DIR"

}

function update_pip() {
    echo -e "Updating pip."
    ${BIN_DIR}/pip install -U pip
}

function install_cookiecutter() {
    echo -e "Installing cookiecutter."
     ${BIN_DIR}/pip install -U cookiecutter
}

function symlink_poetry() {
    echo -e "Symlinking cookiecutter-executable to ~/bin/cookiecutter."
    cd ~/bin && ln -s ~/.local/share/pypoetry/venv/bin/poetry poetry && cd -
}

function create_dir_structure() {
    echo -e "Installing ${INSTALL_DIR}/var."
    mkdir -p ${INSTALL_DIR}/etc
    mkdir -p ${INSTALL_DIR}/var
}

# main program
create_venv
update_pip
install_cookiecutter
# symlink_cookiecutter
create_dir_structure