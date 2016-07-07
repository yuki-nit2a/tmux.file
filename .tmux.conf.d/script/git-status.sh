#!/usr/bin/env bash

cd `tmux display-message -p -F "#{pane_current_path}"`
branch_name=`git branch | grep \*.* | sed -e 's/\*\ //'`

echo $branch_name
