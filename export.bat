@echo off

set ADF_PATH="C:\git\esp-adf"
set IDF_PATH="C:\git\esp-adf\esp-idf"

echo ADF_PATH: %ADF_PATH%
echo IDF_PATH: %IDF_PATH%

call %IDF_PATH%\export.bat
if %errorlevel% neq 0 (goto :ErrorHandling)
python.exe "%ADF_PATH%\tools\adf_install_patches.py" apply-patch
if %errorlevel% neq 0 (goto :ErrorHandling)

echo.
echo The following command can be executed now to view detailed usage:
echo.
echo   idf.py --help
echo.
echo Compilation example (The commands highlighted in yellow below are optional: Configure the chip and project settings separately)
echo.
echo   cd %ADF_PATH%\examples\cli
echo   [33midf.py set-target esp32[0m
echo   [33midf.py menuconfig[0m
echo   idf.py build
echo.

:ErrorHandling
echo The script encountered an error.
goto :eof
