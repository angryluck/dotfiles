# Complicated aliases
function arkiver() {
    if [ $# -eq 1 ]; then
        if [ -e "$1" ]; then
	    if [ -e "$1/.direnv" ]; then
	      echo "Removing .direnv cache"
	      trash "$1/.direnv"
	      trash -f "$1/.envrc"
	    fi
            echo "Flytter $1 til 4-arkiv"
            mv -i "$1" ~/Documents/4-arkiv/ # -i so asks before overwrite
        else
            echo "Error: $1 doesn't exist"
        fi
    else
        echo "Wrong number of arguments ($#)"
    fi
}

function tester() {
  if [ $# -eq 1 ]; then
    if [ -e "$1/.direnv" ]; then
      echo "dirty"
    fi
  fi
}

# expand-multiple-dots.zsh, see 
# https://github.com/parkercoates/dotfiles/blob/main/.zsh/expand-multiple-dots.zsh
#
# Based on http://stackoverflow.com/a/41420448/4757
function expand-multiple-dots() {
    local MATCH
    if [[ $LBUFFER =~ '(^| )\.\.\.+' ]]; then
        LBUFFER=$LBUFFER:fs%\.\.\.%../..%
    fi
}


function expand-multiple-dots-then-expand-or-complete() {
    zle expand-multiple-dots
    zle expand-or-complete
}

function expand-multiple-dots-then-accept-line() {
    zle expand-multiple-dots
    zle accept-line
}



# Bind these functions to tab/enter
zle -N expand-multiple-dots
zle -N expand-multiple-dots-then-expand-or-complete
zle -N expand-multiple-dots-then-accept-line
bindkey '^I' expand-multiple-dots-then-expand-or-complete
bindkey '^M' expand-multiple-dots-then-accept-line


function tex-init() { 
   if [[ $# -ne 1 ]]; then
       echo "Available templates:"
       for template in ~/Documents/3-ressourcer/latex-templates/*.tex; do
           basename "$template" .tex
       done
       echo ""
       echo "Usage: tex-init <template_name>"
       echo "Example:"
       echo "input: tex-init code"
       echo "output: preamble.tex"
       return 1
   fi
   
   cp ~/Documents/3-ressourcer/latex-templates/"$1".tex "preamble.tex"
}


# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function mvcd() {
    # Pass all of your parameters to "mv"
    mv "$@"

    # Shift down all positional parameters except the last one (which should be your destination)
    shift $(( $# - 1 ))

    if [[ -d "${1}" ]]; then
        # Change to your destination if it was a directory
        cd "${1}"

    else
        # Otherwise, assume the destination was a file name and extract its directory component
        cd "$(dirname "${1}")"
    fi
}

function cpcd() {
    # Pass all of your parameters to "mv"
    cp "$@"

    # Shift down all positional parameters except the last one (which should be your destination)
    shift $(( $# - 1 ))

    if [[ -d "${1}" ]]; then
        # Change to your destination if it was a directory
        cd "${1}"

    else
        # Otherwise, assume the destination was a file name and extract its directory component
        cd "$(dirname "${1}")"
    fi
}

# Open *detached* from terminal
function open() {
    case "$1" in
        *.pdf|*.ods)
            setsid xdg-open "$1" &>/dev/null
            ;;
        *)
            xdg-open "$1"
            ;;
    esac
}
function typdf() {
  # typst watch "main.typ" "$1.pdf" --open
  wezterm cli split-pane --bottom --cells 8 -- typst watch "main.typ" "$1.pdf" --open && wezterm cli activate-pane-direction Up
}

function typ() {
  # typst watch "main.typ" "$1" --open
  wezterm cli split-pane --bottom --cells 8 -- typst watch "main.typ" "$1" --open && wezterm cli activate-pane-direction Up
}


# Alternative to 'open'

### NOTE: Copilot answer about syntax
# Most zsh users prefer the simpler POSIX syntax (`name() { }`) for better compatibility and cleaner code. Unless you specifically need the automatic local variable scoping, the simpler syntax is generally preferred.
#
# For maximum portability across shells, `name() { }` is the recommended approach.
function zathura() {
    setsid zathura "$1" &>/dev/null
}

reload() {
  source $ZDOTDIR/.zshrc
}
