setlocal
@echo off

rem Specify the required Python version
set required_version=3.10.11

echo #################################################################################
echo CHECKING PYTHON VERSION
echo #################################################################################

rem Get the installed Python version
for /f "tokens=2 delims= " %%v in ('python --version 2^>^&1') do set python_version=%%v

rem Check if Python is installed
if not defined python_version (
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    echo PYTHON NOT INSTALLED. EXITING.
    echo Recommendation install pyenv for windows and then install python via pyenv
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause 2
    exit /b 1
)

rem Check if the installed version matches the required version
if "%python_version%" neq "%required_version%" (
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    call python -c "print('\N{THUMBS UP SIGN}', end='')" & echo  WRONG PYTHON INSTALLED.     
    echo Required version is %required_version%. Installed version is %python_version%.
    echo EXITING.
    echo Recommendation install pyenv for windows and then install correct 
    echo python version via pyenv
    echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    pause 2
    exit /b 1
)

echo #################################################################################
call python -c "print('\N{THUMBS UP SIGN}', end='')" & echo  CORRECT PYTHON VERSION %required_version% DETECTED.
echo #################################################################################
exit /b 0
