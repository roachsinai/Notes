## Requirements

`cmake boost python2`

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
