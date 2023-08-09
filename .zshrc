#------------------------------
# EXIT IF NON-INTERACTIVE
#------------------------------
case $- in
	*i*)
		;;
	*)
		return
		;;
esac

#------------------------------
# PROMPT
# See: https://wiki.archlinux.org/title/Zsh#Customized_prompt
#------------------------------
# user:~/Directory> command
case $TERM in
	*256color)
		PROMPT="%B%F{62}$(whoami)%f:%F{226}%(4~|.../%3~|%~)%f%F{%(?.green.red)}>%f%b "
		;;
	*)
		PROMPT="%B%F{magenta}$(whoami)%f:%F{cyan}%(4~|.../%3~|%~)%f%F{%(?.green.red)}>%f%b "
		;;
esac

#------------------------------
# HISTORY
#------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt hist_ignore_dups
setopt hist_ignore_space

#------------------------------
# KEYBINDS
#------------------------------
# Vim-like
bindkey -v
# Reduce wait time for escape codes when entering normal mode via Esc
KEYTIMEOUT=1
# Home -> Start of line
bindkey "^[[H" beginning-of-line
# End -> End of line
bindkey "^[[F" end-of-line
# Traverse history based on current linebuffer content
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#------------------------------
# WINDOW TITLE
#------------------------------
# Show name, host, and pwd on idle
# Show command name when something is running
case $TERM in
	*xterm*|termite|rxvt*|(dt|k|E)term)
		__rc_idle_window_title() {
			print -Pn "\e]0;$(whoami)@%M:%~\a"
		}
		__rc_active_window_title() {
			print -Pn "\e]0;$(printf "%s" "$1" | awk '{ print $1 }')\a"
		}
		;;
esac

# user@host:~/Directory
precmd_functions+=( __rc_idle_window_title )
# command
preexec_functions+=( __rc_active_window_title )

#------------------------------
# COMPLETION
#------------------------------
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

#------------------------------
# ALIASES
#------------------------------
# Load aliases file if it exists
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases

#------------------------------
# END WITH SUCCESS CODE
#------------------------------
true
