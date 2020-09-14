#!/usr/bin/env bash

# NOTE: Script uses a MacOS specific clipboard command. MacOS and pbcopy command are required.

current_git_repo=$(pwd)

pushd "$current_git_repo" > /dev/null || exit
  pushd "$(git rev-parse --show-toplevel)" > /dev/null || exit
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  echo "🌿 Current branch: $current_branch"
  if [[ $current_branch == 'main' || $current_branch == 'master' || $current_branch == 'dev' ]]; then
      echo "Switching drivers requires creating a WIP commit, you can't be on main, master, or dev"
      echo "Exiting quietly."
      exit 1
  fi

  git add .
  git commit -m "WIP: $(whoami) completes their turn at $(date -u +'%Y-%m-%d %H:%M:%SZ'). Switching drivers"

  echo "Pushing to git remote!"
  git push -u origin head
  echo "git fetch --prune && git checkout $current_branch && git pull origin $current_branch --rebase" | pbcopy
  popd > /dev/null || exit
popd > /dev/null || exit

echo "
-----------------------------------------------------------------------------
✅ Ready to switch drivers! 🚗 Command to switch drivers copied to clipboard
-----------------------------------------------------------------------------
"
