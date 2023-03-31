#!/usr/bin/env bash

# set -x  # enable for verbose output
set -e # failing commands cause the shell script to exit immediately


CARGO_HOME=/opt/tools/rust
RUSTUP_HOME=~/.config/rustup


function help_() { # don't shadow help-builtin
    echo "Steps:"
    echo "    1) install rust"
    echo "    2) update rust"
    exit
}

function install_rust() {
    echo -e "Installing rust."
    curl -sSf https://sh.rustup.rs | sh
}


function update_rust() {
    echo -e "Updating rust itself."
    rustup ${RUSTUP_HOME}/rustup update
}


# main program
install_rust
update_rust
