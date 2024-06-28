setlocal
@echo off

rem Call the script to check Python version
rem echo looking for python...
rem call python --version
call WIN10_check_python_version.bat

rem Check the error level to determine if there was an issue
if %errorlevel% neq 0 (
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo There was an issue checking Python version.
    rem Handle the issue accordingly
    echo Please install the correct python version
    echo Recommended: use pyenv for windows
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo EXITING
    pause 2
    exit /b 1
) else (
    echo #################################################################################
    call python -c "print('\N{THUMBS UP SIGN}', end='')" & echo  PYTHON version check successful.
    echo #################################################################################
    rem Proceed with the rest of your main script
)


echo checking for python environment named my_env...
rem Check if there is a virtual environment in the current folder
if exist ".\my_venv\Scripts\activate" (
    echo #################################################################################
    call python -c "print('\U0001F984', end='')" & echo  VIRTUAL ENVIRONEMENT my_env FOUND. ACTIVATING...
    rem Activate the virtual environment
    call ".\my_venv\Scripts\activate"
    call python -c "print('\U0001F984', end='')" & echo  VIRTUAL ENVIRONEMENT my_env ACTIVATED.
    call python -c "print('\U0001F984', end='')" & echo  UPDATING requiremnts.txt... SILENTLY
    call python -m pip install -r requirements.txt -q
    echo #################################################################################
) else (
    echo #################################################################################
    echo NO VIRTUAL ENVIRONEMENT my_env FOUND IN CURRENT FOLDER.
    call python -c "print('\U0001F984', end='')" & echo  CREATING NEW ENVIRONEMENT IN SUBFOLDER my_env
    call python -m venv my_venv
    call python -c "print('\U0001F984', end='')" & echo  ACTIVATING...
    call ".\my_venv\Scripts\activate"
    call python -c "print('\U0001F984', end='')" & echo  UPGRADING pip...
    call python -m pip install --upgrade pip
    call python -c "print('\U0001F984', end='')" & echo  INSTALLING requiremnts.txt...
    call python -m pip install -r requirements.txt
    echo #################################################################################
)

rem Note that jupyter notebook does not use the activated env
rem but jupyter lab does....
rem but only if you install in the correct order!
rem first jupyterlab (e.g.==4.0.11)
rem then notebook    (e.g.==6.5.5)
rem you should check which python executable is used in the notebook
rem this exe must be in the environments subfolder!
echo #################################################################################
call python -c "print('\U0001F984', end='')" & echo   STARTING jupyterlab
start /B jupyter lab > NUL 2>&1
