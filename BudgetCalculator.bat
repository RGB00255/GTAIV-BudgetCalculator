@echo off
setlocal enabledelayedexpansion

:: Assume this script is run from the GTA IV root directory
set VEH_IMG=pc\models\cdimages\vehicles.img
set PED_IMG=pc\models\cdimages\componentpeds.img

if not exist "%VEH_IMG%" (
	echo Error: vehicles.img not found at %VEH_IMG%
	exit /b 1
)

if not exist "%PED_IMG%" (
	echo Error: componentpeds.img not found at %PED_IMG%
	exit /b 1
)

:: Get size of vehicles.img
for %%f in ("%VEH_IMG%") do set VEH_SIZE=%%~zf

:: Get size of componentpeds.img
for %%f in ("%PED_IMG%") do set PED_SIZE=%%~zf

:: Initialize sum for mods
set MOD_SUM=0

:: Sum sizes of all .wft and .wtd files in the directory tree
for /r %%f in (*.wft *.wtd) do (
	set /a MOD_SUM += %%~zf
)

:: Calculate total VehicleBudget
set /a VEHICLE_BUDGET = %VEH_SIZE% + %MOD_SUM%

:: Calculate total PedBudget
set /a PED_BUDGET = %PED_SIZE% + %MOD_SUM%
echo VehicleBudget = %VEHICLE_BUDGET%
echo PedBudget = %PED_BUDGET%

pause