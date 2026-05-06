@echo off
REM Minimal-Todo Test Automation Run Script for Windows
REM This script helps run the test suite

setlocal enabledelayedexpansion

echo ==========================================
echo Minimal-Todo Test Automation
echo ==========================================
echo.

REM Check if robot framework is installed
python -m robot --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Robot Framework not installed
    echo Install with: pip install -r requirements.txt
    exit /b 1
)

echo.
echo Select test execution option:
echo 1. Run all tests
echo 2. Run only Positive tests
echo 3. Run only Negative tests
echo 4. Run Add Todo tests
echo 5. Run Mark Done tests
echo 6. Run Delete tests
echo 7. Run Reminder tests
echo 8. Run Night Mode tests
echo.

set /p option="Enter option (1-8): "

if "%option%"=="1" (
    echo Running all tests...
    robot -d results tests/
) else if "%option%"=="2" (
    echo Running Positive tests...
    robot -d results -i Positive tests/
) else if "%option%"=="3" (
    echo Running Negative tests...
    robot -d results -i Negative tests/
) else if "%option%"=="4" (
    echo Running Add Todo tests...
    robot -d results tests/test_add_todo.robot
) else if "%option%"=="5" (
    echo Running Mark Done tests...
    robot -d results tests/test_mark_done.robot
) else if "%option%"=="6" (
    echo Running Delete tests...
    robot -d results tests/test_delete_todo.robot
) else if "%option%"=="7" (
    echo Running Reminder tests...
    robot -d results tests/test_reminder.robot
) else if "%option%"=="8" (
    echo Running Night Mode tests...
    robot -d results tests/test_night_mode.robot
) else (
    echo Invalid option
    exit /b 1
)

echo.
echo Test execution completed!
echo Results are in the 'results' folder
echo.

pause
