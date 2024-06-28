setlocal
@echo off

rem Call the script to check Python version
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
    call python -c "print('\N{THUMBS UP SIGN}', end='')" & echo PYTHON version check successful.
    echo #################################################################################
    rem Proceed with the rest of your main script
)

echo #################################################################################
call python -c "print('\U0001F984', end='')" & echo  STARTING jupyterlab 
start /B jupyter lab > NUL 2>&1
