#!/bin/bash
set -e

# Start from a clean environment
rm -rf venv/

# Basic python2 virtual environment
virtualenv --python=$(which python2) venv

source venv/bin/activate
pip install wheel
pip install -r requirements.txt
