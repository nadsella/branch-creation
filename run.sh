#!/bin/bash

REPO=$1
BRANCH=$2

# If we pass "all" then we want to create branches for all directories
# but we want to give the user the option to only create branches for specific directories
if [ ${REPO} = "all" ]
then
  REPO="web, admin, api"
fi

# Convert comma separated string into an array
IFS=', ' read -r -a directories <<< "$REPO"

# Loop through directories
# checkout development & create the release branch
for dir in ${directories[@]}
  do
    echo "Moving to $dir directory..."
    cd ../$dir
    git checkout development
    git pull
    git checkout -b $BRANCH
  done
