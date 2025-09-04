#!/bin/bash

# Crear entorno virtual llamado audio-env
python3 -m venv audio-env

# Activar entorno
source ./audio-env/bin/activate

# Actualizar pip
pip install --upgrade pip

# Instalar requirements
pip install -r requirements.txt

# Registrar el kernel en Jupyter
python -m ipykernel install --user --name=audio-env --display-name "Python (audio-env)"
