## powershell

#### BaiduPCS-GO

```
function baidu_pcs_login {
    BaiduPCS-Go login -bduss=
}
function baidu_pcs_logout {
    BaiduPCS-Go logout
}

Set-Alias pcsin baidu_pcs_login
Set-Alias pcsout baidu_pcs_logout
```

#### PS 美化

```
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

font: [mononoki-Regular Nerd Font Complete Mono.ttf](https://github.com/haasosaurus/nerd-fonts/blob/regen-mono-font-fix/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf)
color theme: [Monokai Remastered.itermcolors](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Monokai%20Remastered.itermcolors)
