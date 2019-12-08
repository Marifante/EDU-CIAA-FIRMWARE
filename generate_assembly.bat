@echo OFF
REM **********************************************************************
REM * Script para generar los codigos assembly optimizados a O2 del 	 *
REM * FIRMWARE para la placa EDU-CIAA                                    *
REM *                                                                    *
REM * Fecha: 29/10/2019                                                  *
REM *                                                                    *
REM * Autor: Julian Rodriguez (UNSAM)                                    *
REM *                                                                    *
REM **********************************************************************


REM Poner en true el false deleteAfter para generar el codigo asm en cada una de las carpetas asm 
SET deleteAfter=true
SET CPATH=.\src
SET INC_PATH=.\inc

ECHO --------------------------------------------------------------------------
ECHO 	Generando el assembly de lpc_chip_43xx---------------------------------
ECHO --------------------------------------------------------------------------
cd lpc_chip_43xx
REM Creo la carpeta asm si es que no esta
if not exist asm mkdir asm	
REM Borro los archivos .o de lpc_chip_43xx anteriores
del /f /q asm

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -O2 -S -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -DCORE_M4 %CPATH%/%%x -o ./asm/%%x 
	ren .\asm\%%x *.s
)

if %deleteAfter%==true (
	del /f /q asm
)
cd ..

ECHO --------------------------------------------------------------------------
ECHO 	Generando el assembly de edu_ciaa_nxp ---------------------------------
ECHO --------------------------------------------------------------------------
cd edu_ciaa_nxp	
if not exist asm mkdir asm
del /f /q asm

SET INC_LPCCHIPPATH="..\lpc_chip_43xx\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -O2 -S -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -DCORE_M4 %CPATH%/%%x -o ./asm/%%x
	ren .\asm\%%x *.s
)
if %deleteAfter%==true (
	del /f /q asm
)
cd ..

ECHO --------------------------------------------------------------------------
ECHO 	Generando assembly de todas las sources de EDU-CIAA-FIRMWARE-----------
ECHO --------------------------------------------------------------------------
ECHO 	Generando assembly de archivos de lpc4337_specific...

cd firmware_base/libraries/lpc4337_specific
if DELETEAFTER == TRUE del /f /q asm	
del /f /q asm

SET UTILSPATH=".."
SET INC_LPCCHIPPATH="..\..\..\lpc_chip_43xx\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -O2 -S -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -I%UTILSPATH% -DCORE_M4 %CPATH%/%%x -o ./asm/%%x
	ren .\asm\%%x *.s
)
if %deleteAfter%==true (
	del /f /q asm
)
cd ..

ECHO Generando assembly de archivos de board_specific...

cd board_specific
if not exist asm mkdir asm	
del /f /q asm

SET UTILSPATH=".."
SET INC_LPCCHIPPATH="..\..\..\lpc_chip_43xx\inc"
SET INC_LPCSPECIFICPATH="..\lpc4337_specific\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -O2 -S -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -I%INC_LPCSPECIFICPATH% -I%UTILSPATH% -DCORE_M4 %CPATH%/%%x -o ./asm/%%x
	ren .\asm\%%x *.s
)
if %deleteAfter%==true (
	del /f /q asm
)
cd ..\..

ECHO --------------------------------------------------------------------------
ECHO 	Generando assembly del main -------------------------------------------
ECHO --------------------------------------------------------------------------

if not exist asm mkdir asm	
del /f /q asm

SET INC_LPCCHIPPATH="..\lpc_chip_43xx\inc"
SET INC_LIBRARIES="libraries"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -O2 -S -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -I%INC_LIBRARIES% -DCORE_M4 %CPATH%/%%x -o ./asm/%%x
	ren .\asm\%%x *.s
)
if %deleteAfter%==true (
	del /f /q asm
)
cd ..

ECHO --------------------------------------------------------------------------
ECHO 	Assembly generado con exito!! -----------------------------------------
ECHO --------------------------------------------------------------------------