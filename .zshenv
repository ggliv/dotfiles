# Locale
export LANG="en_US.UTF-8"

# Rust toolchain
[ -f ~/.cargo/env ] && . ~/.cargo/env

# User scripts
[ -d ~/.local/bin ] && export PATH=$PATH:~/.local/bin
