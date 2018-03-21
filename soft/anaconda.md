# warnings, bugs solution

if something wrong about screenfetch, matlibplot, and so on, related to anaconda on Gnome shows you this:

```
GLib-GIO-Message: Using the 'memory' GSettings backend.  Your settings will not be saved or shared with other applications.
```

do:

`$ which gsettings`

if it shows anaconda gsettings was used, just change the name of anaconda's gsettings.
