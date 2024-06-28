#!/bin/zsh

# EDIT WITH Text-Wrangle only!! --> UnixLF & UTF8
# make executable :  chmod -x version_diff.command
#ps -p $$

# switch to the folder of the script file
# 
echo "switching to folder of script-file"
cd $(dirname $0)

# Find the first Jupyter notebook in the current directory
echo "looking for first python notebook in the folder"
notebook=$(find . -maxdepth 1 -name "*.ipynb" -print -quit)

echo "$notebook"

echo "Looking for your python version"
call python --version

# Check if a notebook is found
if [[ -n "$notebook" ]]; then
    echo "Starting Jupyter lab and opening notebook: $notebook"
    jupyter lab "$notebook"
else
    echo "No Jupyter notebook found in the current directory."
	echo "staring jupiter lab directly"
	jupyter lab
fi


