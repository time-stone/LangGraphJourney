#!/bin/zsh

# EDIT WITH Text-Wrangle only!! --> UnixLF & UTF8
# make executable :  chmod -x version_diff.command
#ps -p $$

# switch to the folder of the script file
# 
echo "switching to folder of script-file"
cd $(dirname $0)

# Find the first Jupyter notebook in the current directory
#echo "looking for first python notebook in the folder"
#notebook=$(find . -maxdepth 1 -name "*.ipynb" -print -quit)

echo "Looking for your python version"
python --version

# Check if there's a virtual environment
if [[ -d "my_venv" && -f "my_venv/bin/activate" ]]; then
    echo "Virtual environment found. Activating..."
    source my_venv/bin/activate
    echo "updating requirements.txt ---> this may take some time"
    python -m pip install -r requirements.txt -q
else
   echo "No virtual environment found. creating, installing and activating"
   python -m venv my_venv
   source my_venv/bin/activate
   echo "upgrading pip..."
   python -m pip install --upgrade pip
   echo "installing requirements.txt ---> this will take some time"
   python -m pip install -r requirements.txt
fi

#echo "$notebook"

# Check if a notebook is found
#if [[ -n "$notebook" ]]; then
#    echo "Starting Jupyter lab and opening notebook: $notebook"
#    jupyter lab "$notebook"
#else
#    echo "No Jupyter notebook found in the current directory."
#	echo "staring jupyter lab directly"
	jupyter lab
#fi


