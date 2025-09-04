#!/bin/bash

# Crear entorno virtual llamado SAMAY
python3 -m venv SAMAY

# Activar entorno
source ./SAMAY/bin/activate

# Actualizar pip
pip install --upgrade pip

# Instalar requirements
pip install -r requirements.txt

# Registrar el kernel en Jupyter
python -m ipykernel install --user --name=SAMAY --display-name "Python (SAMAY)"
