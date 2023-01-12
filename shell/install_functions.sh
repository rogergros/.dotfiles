#!/bin/bash

create_links() {
  while IFS= read -r line
  do
    CREATE_LINK_CMD="ln -sf $line"
    echo "${green}Created link:${reset} $CREATE_LINK_CMD"
  done < "$1"
}
