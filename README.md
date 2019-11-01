# NOTES

## Git setting
set editor: git config --global core.editor vim

set username and password: git config --global credential.helper store

## Windows: install Opencv & tesseract with python
https://pypi.org/project/tesserocr/

Install Anaconda https://www.continuum.io/downloads

conda create --name cv python=3.6

conda activate cv

pip install opencv-contrib-python

pip install imutils

pip install image

conda install -c simonflueckiger/label/tesseract-4.0.0-master tesserocr 

conda install -c conda-forge pytesseract
