@echo off
cls

cl ^
    /c /Fo /nologo /EHa- /EHs- /GR- /GS- /Gd /Gm- /Gy /MD /O2 /Oi- /Oy- /TP /W3 /WX- /Zc:forScope /Zc:inline /Zc:wchar_t /wd4316 /wd4530 /fp:strict ^
    /DTARGET_IA32E /DHOST_IA32E /DTARGET_WINDOWS /DWIN32 /D__PIN__=1 /DPIN_CRT=1 /D_STLP_IMPORT_IOSTREAMS /D__LP64__ ^
    /I"%PIN_ROOT%\extras\xed-intel64\include\xed" ^
    /I%PIN_ROOT%\source\include\pin ^
    /I%PIN_ROOT%\source\include\pin\gen ^
    /I%PIN_ROOT%\source\tools\InstLib   ^
    /I%PIN_ROOT%\extras\components\include ^
    /I%PIN_ROOT%\extras\stlport\include ^
    /I%PIN_ROOT%\extras ^
    /I%PIN_ROOT%\extras\libstdc++\include ^
    /I%PIN_ROOT%\extras\crt\include ^
    /I%PIN_ROOT%\extras\crt ^
    /I"%PIN_ROOT%\extras\crt\include\arch-x86_64" ^
    /I%PIN_ROOT%\extras\crt\include\kernel\uapi ^
    /I"%PIN_ROOT%\extras\crt\include\kernel\uapi\asm-x86" ^
    /FIinclude/msvc_compat.h Resolver.cpp ImageManager.cpp ImageManager.h jsoncpp.cpp

link ^
    /ERRORREPORT:QUEUE ^
    /OUT:Resolver64.dll ^
    /INCREMENTAL:NO ^
    /NOLOGO ^
    /LIBPATH:%PIN_ROOT%\intel64\lib ^
    /LIBPATH:"%PIN_ROOT%\intel64\lib-ext" ^
    /LIBPATH:"%PIN_ROOT%\extras\xed-intel64\lib" ^
    /LIBPATH:%PIN_ROOT%\intel64\runtime\pincrt pin.lib xed.lib pinvm.lib pincrt.lib ntdll-64.lib kernel32.lib crtbeginS.obj ^
    /NODEFAULTLIB ^
    /MANIFEST:NO ^
    /OPT:NOREF ^
    /TLBID:1 ^
    /ENTRY:"Ptrace_DllMainCRTStartup" ^
    /BASE:"0xC5000000" ^
    /DYNAMICBASE ^
    /NXCOMPAT ^
    /IMPLIB:Resolver.lib ^
    /MACHINE:X64 ^
    /SAFESEH:NO ^
    /export:main ^
    /ignore:4049 ^
    /ignore:4210 ^
    /ignore:4217 ^
    /ignore:4281 ^
    /DLL Resolver.obj ImageManager.obj jsoncpp.obj

del *.obj *.pdb *.exp *.lib
