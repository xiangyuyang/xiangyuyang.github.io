### To install TF on Windows,  with Anaconda Python 3.5 (64 bit)
. conda create --name tensorflow python=3.5
. activate tensorflow
. conda install jupyter
. conda install scipy
. pip install tensorflow-gpu

### SSH connections hanging from WSL2
ifconfig eth0 mtu 1400
