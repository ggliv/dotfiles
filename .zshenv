#------------------------------
# EDITOR
#------------------------------
# nvim > vim > vi
if command -v nvim > /dev/null; then
	export EDITOR="nvim"
	export VISUAL="nvim"
elif command -v vim > /dev/null; then
	export EDITOR="vim"
	export VISUAL="vim"
else
	export EDITOR="vi"
	export VISUAL="vi"
fi

#------------------------------
# LOCALE
#------------------------------
export LANG="en_US.UTF-8"

#------------------------------
# $PATH ADDITIONS
#------------------------------
# User scripts
[ -d ~/.local/bin ] && export PATH=~/.local/bin:$PATH
# Rust toolchain
[ -f ~/.cargo/env ] && . ~/.cargo/env

#------------------------------
# MISC ENV VARS
#------------------------------
# Opt out of dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
