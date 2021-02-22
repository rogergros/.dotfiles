#!/usr/bin/env bash

if ! ${DOT_MAIN_SOURCED:-false}; then
  source "$DOTFILES_PATH/shell/scripts/core/args.sh"
  source "$DOTFILES_PATH/shell/scripts/core/collections.sh"
  source "$DOTFILES_PATH/shell/scripts/core/log.sh"
  source "$DOTFILES_PATH/shell/scripts/core/platform.sh"
  source "$DOTFILES_PATH/shell/scripts/core/output.sh"
  source "$DOTFILES_PATH/shell/scripts/core/str.sh"
  source "$DOTFILES_PATH/shell/scripts/core/paths.sh"

  readonly DOT_MAIN_SOURCED=true
fi
