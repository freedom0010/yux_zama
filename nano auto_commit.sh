#!/bin/bash

git init

echo "# My Project" >> README.md
git add README.md
git commit -m "Initial commit"

for i in {1..10}; do
    echo "Commit $i line" >> README.md
    git add README.md

    day=$((10 + RANDOM % 10))
    hour=$(printf "%02d" $((RANDOM % 24)))
    min=$(printf "%02d" $((RANDOM % 60)))
    sec=$(printf "%02d" $((RANDOM % 60)))

    export GIT_AUTHOR_DATE="2025-06-${day}T${hour}:${min}:${sec}"
    export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"

    git commit -m "commit $i"
    echo "提交 $i 时间: $GIT_AUTHOR_DATE"
done

