## 下载*youtube*的 [Computer Science 61A, 001 - Spring 2015](https://www.youtube.com/playlist?list=PL-XXv-cvA_iBM29DgZsGaQihJp8lLQn3J) 播放列表下的视频和*youtube*自带的字幕

`youtube-dl -t --write-auto-sub --proxy socks5://127.0.0.1:1080 -f best https://www.youtube.com/playlist?list=PL-XXv-cvA_iBM29DgZsGaQihJp8lLQn3J`

#### 修改下载*youtube*自动生成的字幕的格式

**去除所有 <> 之间包含的时间**

```
# 对从youtube上下载的字幕进行处理——去掉所有的r'<>'即可
# 原始字幕如下：
# 00:00:00.000 --> 00:00:06.229 align:start position:0%
# <c.colorCCCCCC>oh<00:00:01.949><c> ok</c></c><00:00:02.639><c> let's</c><00:00:02.970><c> get</c><00:00:03.090><c> started</c><c.colorCCCCCC><00:00:03.360><c> can</c></c>

# 00:00:06.229 --> 00:00:06.629 align:start position:0%
# <c.colorCCCCCC>oh ok</c> let's get started<c.colorCCCCCC> can
# </c>

# 处理之后的字幕：
# 00:00:00.000 --> 00:00:06.229 align:start position:0%
 
# oh ok let's get started can

# 00:00:06.229 --> 00:00:06.629 align:start position:0%
# oh ok let's get started can


import os, re

path = os.getcwd()
reg_str = r'\<[^>]*\>'

for file in os.listdir():
    if file[-3:] == "vtt":
        with open(file, 'r') as infile, open (file+'1', 'w') as outfile:
            for line in infile:
                outfile.write(re.sub(reg_str,'',line))

for file in os.listdir():
    if file[-3:] == 'vtt':
        os.remove(file)
    elif file[-4:] == 'vtt1':
        os.rename(os.path.join(path,file),os.path.join(path,file[:-1]))
```
