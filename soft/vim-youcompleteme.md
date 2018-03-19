## Requirements

`cmake boost python2 clang`

## install

安装其实有两种方法：一种是讲Github上面的代码使用Vundle下载后调用作者提供的脚本安装；另一种是自己编译安装。

第一种：

`./install.py --clang-completer --system-libclang`

再这种情况下，如果系统更新之后YCM出错，就使用Vundle更新一下YCM代码再使用脚本重新安装。

第二种，如下：

### download ycm by vundle

```
call vundle#begin()
Plugin 'Valloric/YouCompleteMe ’
call vundle#end()

:PluginInstall
```

### generate makefile

```
mkdir ~/.ycm_build
cd ~/.ycm_build

cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
```

### build ycm_core

`cmake --build . --target ycm_core --config Release`

### config

```
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~

“ ～/.vimrc
let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
```

## FAQs

If ycm report can't find libboost\*.so, when you use vim, it means you should rebuild ycm.
