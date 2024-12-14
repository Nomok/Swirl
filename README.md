# Swirl

## Purpose
A shader that adds a "swirl" distortion effect.

## Compiling:

### Requisites:
FXC (apart of the [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/))

### Windows: 
1. Insert `FXC.exe` into the root directory or insert the path for FXC in line 11 of `CompileShader.bat`
2. Run `CompileShader.bat`
3. You should get a successful compilation message:
```
fxc.exe "swirl.hlsl" /nologo /WX /Ges /Qstrip_reflect /Qstrip_debug /Tps_4_0 /Eps_main /Fo"swirl.fxc"
compilation object save succeeded; see Z:\Swirl\swirl.fxc
.
Shaders compiled ok
```

## TODO
- Anti-Aliasing
- Android Support
- MacOS / IOS Support