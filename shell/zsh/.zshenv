#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
export DOTFILES_PATH="${HOME}/.dotfiles"

CUSTOM_ENV_FILE=${HOME}/.zshenv_custom
if [[ -f "$CUSTOM_ENV_FILE" ]]; then
    source "${HOME}/.zshenv_custom"
fi
