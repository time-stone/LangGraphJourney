Write-Host "looking for python..."
call python --version
Write-Host "checking for python environment named my_env..."

# Check if there is a virtual environment in the current folder
if (Test-Path ".\my_venv\Scripts\activate") {
    Write-Host "Virtual environment my_env found. Activating..."
    # Activate the virtual environment
    & ".\my_venv\Scripts\Activate"
    Write-Host "Virtual environment my_env activated."
	Write-Host "updating requirements.txt..."
    call python -m pip install -r requirements.txt -q
} else {
    Write-Host "No virtual environment my_env found in the current folder."
    Write-Host "CREATING NEW ENVIRONMENT IN SUBFOLDER my_env"
    call python -m venv my_venv
    Write-Host "Activating..."
    & ".\my_venv\Scripts\Activate"
    Write-Host "upgrading pip..."
    call python -m pip install --upgrade pip
    Write-Host "installing requirements.txt..."
    call python -m pip install -r requirements.txt
}

# Note that jupyter notebook does not use the activated env
# but jupyter lab does....
# but only if you install in the correct order!
# first jupyterlab (e.g.==4.0.11)
# then notebook    (e.g.==6.5.5)
# you should check which python executable is used in the notebook
# this exe must be in the environments subfolder!
Write-Host "starting jupyterlab"
jupyter lab