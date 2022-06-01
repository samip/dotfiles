git diff --cached # git: staged changes
git commit -a --amend --no-edit && git push -f # git: Amend and force push
git fetch origin main:main && git rebase main # git: update main and rebase on it
git diff main.. # git: diff main
git push -o ci.skip # Gitlab push without triggering CI
git shortlog -s -n # git: number of comments by person
git rev-list main.. --count # git: commit count in branch
git rebase -i HEAD~$(git rev-list main.. --count) # git: interactive rebase on branch

for i in {0..255}; do     printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done   # Print bash colors

npm list -dev # npm: list dev depencies
npm list -prod # npm: list prod depencies
npm run # npm: list npm

docker rm -f $(docker ps -aq) # Docker: remove all processes

nvim $(git diff main.. --name-only) # Open changed files in vim
nvim $(git diff main.. --name-only | grep -E '\.vue|\.js$|\.py') # Open changed .vue .js .py

i3-msg reload && i3-msg restart # i3 reload config restart

git log -L110,110:/lib/client.js # Show log for certain line
