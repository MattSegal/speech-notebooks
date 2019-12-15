#!/bin/bash
if [[ -z "$1" ]]; then
    echo "ERROR: Porject path parameter missing"
    exit 1
fi
PROJ_PATH="$1"
if [[ ! -d "env" ]]; then
    virtualenv -p python3 env
fi
. ./env/bin/activate
pip install -r requirements.txt
pip install -r $1/requirements.txt
ln -s "../$1/data" notebooks/data
ln -s "../$1/src" notebooks/src
ln -s "../$1/checkpoints" notebooks/checkpoints
