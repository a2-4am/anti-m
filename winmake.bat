@echo off
rem
rem Anti-M Makefile for Windows
rem assembles source code, optionally builds a disk image
rem
rem a qkumba monstrosity from 2019-04-11
rem

set BUILDDISK=build\anti-m
set VOLUME=ANTI.M

rem third-party tools required to build (must be in path)
rem https://sourceforge.net/projects/acme-crossass/
set ACME=acme
rem https://www.brutaldeluxe.fr/products/crossdevtools/cadius/
rem https://github.com/mach-kernel/cadius
set CADIUS=cadius

if "%1" equ "asm" (
:asm
2>nul md build

%ACME% -r build\anti-m.lst src\anti-m.a
1>nul copy /y res\work.bin "%BUILDDISK%.po"
1>nul copy /y res\_FileInformation.txt build\ >>build\log
%CADIUS% ADDFILE "%BUILDDISK%.po" "/%VOLUME%/" "build\ANTI.M.SYSTEM" >>build\log
%ACME% -r build\proboot.lst src\proboot.a
cscript /nologo bin/changebootloader.js "%BUILDDISK%.po" build\proboot
cscript /nologo bin/po2do.js build\ build\
2>nul del "%BUILDDISK%.po"
goto :EOF
)

if "%1" equ "clean" (
:clean
echo y|1>nul 2>nul rd build /s
goto :EOF
)

echo usage: %0 clean / asm
