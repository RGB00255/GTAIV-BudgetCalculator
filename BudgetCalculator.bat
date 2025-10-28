@echo off

:: Assume this script is run from the GTA IV root directory
set VEH_IMG=pc\models\cdimages\vehicles.img

if not exist "%VEH_IMG%" (
	echo Error: vehicles.img not found at %VEH_IMG%
	exit /b 1
)

:: Get size of vehicles.img
for %%f in ("%VEH_IMG%") do set VEH_SIZE=%%~zf

:: Initialize sum for mods
set MOD_SUM=0

:: Sum sizes of all .wft and .wtd files in the directory tree
	for /r %%f in (*.wft *.wtd) do (
	set /a MOD_SUM += %%~zf
)

:: Calculate total VehicleBudget
set /a VEHICLE_BUDGET = %VEH_SIZE% + %MOD_SUM%
echo VehicleBudget = %VEHICLE_BUDGET%
pause