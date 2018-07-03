## 使用audacity消除噪音

[How to Remove Background Noise from a Video in Linux](https://www.youtube.com/watch?v=AeOjtMOq3EU&t=140s)

+ 将音频文件或者ffmpeg导出的音频文件拖入audacity，然后选择噪音对应的某一片段
+ 工具栏->效果->降噪->取得噪声特征
+ Ctrl+A->效果->降噪->确定（默认参数即可）
+ 导出->命名（挑选一个格式）

#### ffmpeg导出视频中的文件命令

`ffmpeg -i input.mp4 -vn -ac 2 -ar 44100 -ab 320k -f mp3 output.mp3`
