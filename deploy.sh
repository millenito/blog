#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

if ! [ -d public ]; then
    git submodule add git@github.com:millenito/millenito.github.io.git public
fi

hugo
cd public

git add -A
git commit -m "Date $(date) : Rebuild site"
git push --force origin HEAD:master
