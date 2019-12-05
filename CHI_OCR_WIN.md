# Chinese OCR on Windows Environment

## Ref code:
git: https://github.com/YCG09/chinese_ocr
local: c:\work\tensorflow\chi_ocr_win

## Windows Environment
* Install Visual Studio 2017 (VC++)
* Install Anaconda https://www.continuum.io/downloads
* conda create --name ocr36_win python=3.6 
* conda activate ocr36_win
* install packages:
** pip install numpy scipy matplotlib pillow  -i https://pypi.douban.com/simple/
** pip install easydict opencv-python keras h5py PyYAML -i https://pypi.douban.com/simple/
** pip install cython==0.24 -i https://pypi.douban.com/simple/
** pip install tensorflow==1.3.0  -i https://pypi.douban.com/simple/
** pip install keras==2.0.6 -i https://pypi.douban.com/simple/
Note that Keras' version should match tensorflow, ref: 
https://docs.floydhub.com/guides/environments/
tensorflow-1.3	TensorFlow 1.3.0 + Keras 2.0.6 on Python 3.6.

## Build
* Start x64 Native Tools Command Prompt for VS 2017
* conda activate ocr36_win
* cd c:\work\tensorflow\chi_ocr_win, and run:
** cd .\ctpn\lib\utils
** cython bbox.pyx
** cython cython_nms.pyx
** python setup_cpu.py build_ext --inplace
** copy /Y utils\*
** del /S /Q utils
** del /S /Q build
** cd ..\..\..

## Fix code
* change File "ctpn\lib\utils\cython_nms.pyx", line 25, 
	from 
  cdef np.ndarray[np.int_t, ndim=1] order = scores.argsort()[::-1]
  	to
  cdef np.ndarray[np.int_t, ndim=1] order = scores.argsort()[::-1].astype('int32')

* delete line 23 of demo.py: 
	Image.fromarray(image_framed).save(output_file)

## Run demo
* put images into .\test_images
* python demo.py
