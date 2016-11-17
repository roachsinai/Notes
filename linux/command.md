## 更新 ruby 软件

ruby:
    gem:
        sudo gem update --system

## linux下查看文件编码及修改文件编码

1. 使用 Vim

2. 使用 enca 命令

    + 查看当前文件的编码：`enca -L zh_CN file.txt`
    + 转换文件到目标编码：
    	- `enca -L 当前语言 -x 目标编码 文件名`
    	- `enca -L zh_CN -x UTF-8 * ` 转换当前文件夹下的所有文件
    	- `enca -L zh_CN -x UTF-8 < file1 > file2` 如果不想覆盖原文件
