#!/bin/bash
cd ../..

# Create virtual env and activate
python3 -m venv env
source env/bin/activate

# install what we need
pip install -r local\requirements-local.txt