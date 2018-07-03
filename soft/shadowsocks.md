## VPS启动SS服务

#### 开机自启——`update-rc.d`

`cat /etc/shadowsocks.json`

```json
{
    "server":"",
    "local_address":"127.0.0.1",
    "server_port":,
    "password":"",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open":true
}
```

`cat  /etc/init.d/shadowsocks`

```bash
#!/bin/sh
### BEGIN INIT INFO
# Provides:          shadowsocks
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: start shadowsocks
# Description:       start shadowsocks
### END INIT INFO


start(){
        sudo ssserver -c /etc/shadowsocks.json -d start
}
stop(){
        sudo ssserver -c /etc/shadowsocks.json -d stop
}
restart(){
        sudo ssserver -c /etc/shadowsocks.json -d restart
}

case "$1" in
start)
        start
        ;;
stop)
        stop
        ;;
restart)
        restart
        ;;
*)
        echo "Usage: $0 {start|restart|stop}"
        exit 1
        ;;
esac
```

```bash
sudo chmod +x /etc/init.d/shadowsocks

sudo update-rc.d shadowsocks defaults

sudo service shadowsocks {start|restart|stop}
```

也可以使用`sudo nohup ssserver -c /etc/shadowsocks.json > /etc/shadowsocks/log &`替换`/etc/init.d/shadowsocks`中的内容，效果相同。

**注**：不知道为什么必须加上`sudo`。

#### 开机自启——rc.local

`vim /etc/rc.local`在`exit 0`之前添加`sudo nohup ssserver -c /etc/shadowsocks.json > /etc/shadowsocks/log &`

**注**：在`rc.local`中添加的命令必须是可以退出的（不能是循环等待输入之类的命令，系统在加载该文件时必须执行某个`exit`退出，再加载其他的配置）。

#### 或者

+ ssh连接VPS后执行，ssserver -p **server_port** -k **passward** -m **protocol** --user nobody -d start

#### Refs

1. [Ubuntu 下配置 shadowsocks以及开机自启](http://happylcj.github.io/2016/06/14/Ubuntu%E4%B8%8B%E9%85%8D%E7%BD%AEshadowsocks%E4%BB%A5%E5%8F%8A%E5%BC%80%E6%9C%BA%E8%87%AA%E5%90%AF/)
2. [添加SHADOWSOCKS服务到自启动](http://blog.zhuzhilei.com/shadowsocks-server-auto-start-linux/)