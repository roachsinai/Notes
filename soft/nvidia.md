# Install NVIDIA Drivers and Bumbelee

```
~~sudo vim /etc/modprobe.d/nouveau_blacklist.conf~~
~~add:    blacklist nouveau~~

~~sudo mkinitcpio -p linux414~~

~~sudo mhwd -a pci nonfree 0300~~
~~reboot~~

sudo pacman -S virtualgl lib32-virtualgl lib32-primus primus
sudo mhwd -f -i pci video-hybrid-intel-nvidia-bumblebee
sudo systemctl enable bumblebeed
sudo mkinitcpio -p linux414

reboot

if you find the login DM can not appear, do this:

> Use Xorg backend
>
> The Wayland backend is used by default and the Xorg backend is used only if the Wayland backend cannot be started. As the Wayland backend has been reported to cause problems for some users, use of the Xorg backend may be necessary. To use the Xorg backend by default, edit the /etc/gdm/custom.conf file and uncomment the following line:
>
> #WaylandEnable=false

the above is for gdm, if you use others, find the related ArchWiki.
```

## check nvidia driver

```
optirun -b none nvidia-settings -c :8
primusrun glxspheres64
```

And then if you want any application use NVIDIA GPU, use:

`optirun app`, such as `optirun ipython`

# Refs

[Configure NVIDIA (non-free) settings and load them on Startup](https://wiki.manjaro.org/index.php?title=Configure_NVIDIA_(non-free)_settings_and_load_them_on_Startup)
