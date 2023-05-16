#!/usr/bin/env bash

rm -rf CQ-editor
git clone git@github.com:CadQuery/CQ-editor.git
# Apply patch from https://github.com/CadQuery/CQ-editor/pull/357#issuecomment-1294051468
cd CQ-editor && git apply ../cq-editor-pip.diff && cd ..

rm -rf cadquery_venv
python3 -m venv cadquery_venv
source cadquery_venv/bin/activate
pip install --upgrade pip
pip install wheel

# TODO: Remove once https://github.com/DanielBok/nlopt-python/issues/19 is resolved
pip install swig
pip install numpy
pip install git+https://github.com/DanielBok/nlopt-python.git@develop/3.11

pip install git+https://github.com/CadQuery/cadquery.git
pip install ./CQ-editor
