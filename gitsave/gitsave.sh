#!/usr/bin/env bash

# Want to use git but don't really care about git history -- just save my changes
# this script adds all the things to staging, creates a commit, and pushes to remote branch

current_git_repo=$(pwd)

if [[ ! -d .git ]]; then
  echo "Stopping. Current directory is not a git repository."
  exit 1
fi

pushd "$current_git_repo" > /dev/null || exit
  pushd "$(git rev-parse --show-toplevel)" > /dev/null || exit
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  echo "🌿 Current branch: $current_branch"

  git add .
  git commit -m "Saving changes [$(whoami) $(date -u +'%Y-%m-%d %H:%M:%SZ')]"

  echo "Pushing to git remote!"
  git push -u origin head
  popd > /dev/null || exit
popd > /dev/null || exit

echo "
-----------------------------------------------------------------------------
✅ Git changes saved successfully!
-----------------------------------------------------------------------------
"
