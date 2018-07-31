# ignore special pkg when upgradeing

```
sudo vim /etc/pacman.conf

Add,

IgnorePkg = cuda cudnn
```

# Downgrade/Install_offline package

1. download pkg from [ala](https://archive.archlinux.org/packages)
2. sudo pacman -U path/to/pkg