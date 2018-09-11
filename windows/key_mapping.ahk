#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Notes:
; #==win
; !==Alt
; ^==Ctr
; +==shift

;快速打开网页
;=========================================================================
#b::Run https://www.baidu.com/
#c::Run https://www.google.com/
#v::Run https://www.v2ex.com/


;快速打出常用语
;=========================================================================
::/gm::roachsinai@gmail.com
::/qm::roachsinai@qq.com
::/1m::ihaozq@163.com
::/con::console.log();
::/js::javascript
::/gre::https://github.com/roachsinai?tab=repositories
::/gho::https://github.com/roachsinai
::/gst::https://github.com/roachsinai?tab=stars
::/jl::https://www.booktxt.net/5_5871/
::/jlb::https://tieba.baidu.com/f?kw=%BD%A3%C0%B4&fr=ala0&loc=rec
::/wy::https://www.booktxt.net/2_2591/
::/wz::site:zhihu.com


;Ctrl+shift+c拷贝文件路径
;=========================================================================
^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return
;启动程序快捷键
;=========================================================================
!n::run notepad

!r::
SetTitleMatchMode, 2
ifwinactive, ahk_class CabinetWClass
  ControlGetText, address , edit1, ahk_class CabinetWClass
else
  address =

; Exclude specific windows

ifwinactive, My Computer
  address =
ifwinactive, My Documents
  address =

if (address <> "") 
  Run, cmd.exe, %address%
else 
  Run, cmd.exe, C:\Users\DD\Documents
return

psScript := "C:\Users\DD\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
!p:: Run, powershell.exe "%psScript%", C:\Users\DD\Documents

!c::run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
!f::run, C:\Program Files\Everything\Everything.exe

;!ac::run, %ComSpec% /K C:\Users\DD\Miniconda3\Scripts\activate.bat C:\Users\DD\Miniconda3\envs\nn

;激活/打开/隐藏程序
;=========================================================================
^#c::
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

; 区块注释
;=========================================================================
!^c::
    send ^c
    thisvar := clipboard
    thisvar := ";" thisvar
    clipboard := thisvar
    send ^v
return

;自带快捷键
;=========================================================================
;WIN + CTRL + 左/右: 切换到前一个或后一个桌面
;WIN + CTRL + D: 创建一个新的桌面
;WIN + CTRL + F4:关闭当前桌面
;WIN + TAB: 开启任务试视图 


; 关机 重启 强制重启 挂起 休眠
;=========================================================================
!^1::Shutdown, 9
!^2::shutdown 2
; Force a reboot (reboot + force = 2 + 4 = 6):
!^3::Shutdown 6

; Call the Windows API function "SetSuspendState" to have the system suspend or hibernate.
; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
; Parameter #3: Pass 1 instead of 0 to disable all wake events.
!^4:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
!^5:: DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)

; putty
;=========================================================================
;Run "C:\Program Files\Putty\putty.exe" -load "server" -l user -pw password

;Ctrl+Win+p取光标所在处颜色至剪切板
;=========================================================================
^#p::
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
; 把 color 的值发送到剪贴板
return

;音量
;=========================================================================
^F11::SoundSet,-5
^F12::SoundSet,+5

;当鼠标位于任务栏内的时候，滚动鼠标滚轮控制音量大小，按下鼠标中键静音。并且不管任务栏在哪个位置均能正常工作。关键代码：
MouseIsOver(WinTitle) {
MouseGetPos,,, Win
return WinExist(WinTitle . " ahk_id " . Win)
}

WheelDown::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
;SoundSet,-1
Send, {Volume_Down 1}
Else
MouseClick,WD
Return

WheelUp::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
;SoundSet,+1
Send, {Volume_Up 1}
Else
MouseClick,WU
Return

MButton::
If (MouseIsOver("ahk_class Shell_TrayWnd"))
Send,{Volume_Mute}
Else
MouseClick,Middle
Return

^Up::Send {Volume_Up 1} ;Ctrl+上箭头 增加音量
^Down::Send {Volume_Down 1} ;Ctrl+下箭头 减少音量
^left::Send {Volume_Mute} ;Ctrl+右箭头 静音

;用 Google 搜索选中的文字
;=========================================================================
!g:: 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
Run http://www.google.com/search?q=%clipboard% 
return 

;HeyoDict
;=========================================================================
;按下一次d只输入一次d
;$d::Send, d
;上面不可以使用d::Send, d，这样会一直输入d循环

!d::
Input, UserInput, , {enter}
if (ErrorLevel = "Max")
{
    MsgBox, You entered "%UserInput%", which is the maximum length of text.
    return
}
if (ErrorLevel = "Timeout")
{
    MsgBox, You entered "%UserInput%" at which time the input timed out.
    return
}
if (ErrorLevel = "NewInput")
    return
If InStr(ErrorLevel, "EndKey:")
{
    Run %comspec% /k C:\Users\DD\Miniconda3\python.exe C:\Users\DD\Documents\__Code_Inc\Git\HeyoDict\dict %UserInput% && pause && exit
    ;MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
    return
}

return