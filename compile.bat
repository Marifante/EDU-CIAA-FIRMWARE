@echo OFF
REM **********************************************************************
REM * Script para generar el archivo de programacion del micro LPC-4337  *
REM * de la placa EDU-CIAA                                               *
REM *                                                                    *
REM * Fecha: 29/10/2019                                                  *
REM *                                                                    *
REM * Autor: Julian Rodriguez (UNSAM)                                    *
REM *                                                                    *
REM **********************************************************************


REM Este archivo va en la carpeta principal del firmware
SET CPATH=.\src
SET INC_PATH=.\inc

ECHO Compilar todas las sources de lpc_chip_43xx--------------------------------
cd lpc_chip_43xx
REM Creo la carpeta obj si es que no esta
mkdir -p obj	
REM Borro los archivos .o de lpc_chip_43xx anteriores
del /f /q obj

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -c -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -DCORE_M4 %CPATH%/%%x -o ./obj/%%x
	ren .\obj\%%x *.o
)
cd ..

ECHO Compilar todas las sources de lpc_chip_43xx--------------------------------
cd edu_ciaa_nxp	
mkdir obj
del /f /q obj

SET INC_LPCCHIPPATH="..\lpc_chip_43xx\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -c -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -DCORE_M4 %CPATH%/%%x -o ./obj/%%x
	ren .\obj\%%x *.o
)
cd ..

ECHO Compilar todas las sources de EDU-CIAA-FIRMWARE----------------------------
ECHO Compilando archivos de lpc4337_specific...
cd firmware_base/libraries/lpc4337_specific
mkdir obj
del /f /q obj

SET UTILSPATH="..\"
SET INC_LPCCHIPPATH="..\..\..\lpc_chip_43xx\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -c -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -I%UTILSPATH="..\"-DCORE_M4 %CPATH%/%%x -o ./obj/%%x
	ren .\obj\%%x *.o
)
cd ..

ECHO Compilar todas las sources de EDU-CIAA-FIRMWARE----------------------------
ECHO Compilando archivos de lpc4337_specific...
cd board_specific
mkdir obj
del /f /q obj

SET INC_LPCCHIPPATH="..\..\..\lpc_chip_43xx\inc"
SET INC_LPCSPECIFICPATH="..\lpc4337_specific\inc"

for /F %%x in ('dir /B/D %CPATH%') do (
	arm-none-eabi-gcc -c -Wall %DEBUG% -fdata-sections --function-sections -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -I%INC_PATH% -I%INC_LPCCHIPPATH% -I%INC_LPCSPECIFICPATH% -DCORE_M4 %CPATH%/%%x -o ./obj/%%x
	ren .\obj\%%x *.o
)
cd ..

