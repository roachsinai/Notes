# installation

> Python == 2.7* or ( >= 3.4 and < 3.6 )
> > The development package (python-dev or python-devel on most Linux distributions) is recommended (see just below). Python 2.4 was supported up to and including the release 0.6. Python 2.6 was supported up to and including the release 0.8.2. Python 3.3 was supported up to and including release 0.9.
> 2018.02.09

我的`Python`状态：

- python 3.6

所以使用`pip`安装（`conda`没有支持的软件包），之后导入报错让安装`pygpu>=0.7.0,<0.8.0`（`conda`安装的版本低，使用`conda-forge`）

```
pip install theano
conda install -c conda-forge pygpu
```

# use gpu

`vim .theanorc`

```
[global]
device = cuda
floatX = float32
```

