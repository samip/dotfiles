#!/bin/sh
git diff --cached # GIT STAGED CHANGES
git co main & git pull && git co - # UPDATE MAIN
git commit -a --amend --no-edit && git push -f # Amend and force push
git fetch origin main:main && git rebase main # GIT update main and rebase on it
git diff main.. # GIT diff main
git push -o ci.skip # Gitlab push without triggering skip CI
git fetch origin main:main && git rebase main # GIT update main and rebase on it
git shortlog -s -n # GIT number of comments by person
git rev-list main.. --count # Git commit count in branch
git rebase -i HEAD~$(git rev-list main.. --count) # GIT interactive rebase on branch
git fetch origin main:main && git rebase main # GIT update main and rebase on it
for i in {0..255}; do     printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done   # Print bash colors
npm list -dev # list dev depencies
npm list -prod # list prod depencies
npm run # list npm scripts
docker rm -f $(docker ps -aq) # Docker: remove all processes
nvim $(git diff main.. --name-only) # Open changed files in vim
nvim $(git diff main.. --name-only | grep -E '\.vue|\.js$|\.py') # Open changed .vue .js .py
i3-msg reload && i3-msg restart # i3 reload restart
