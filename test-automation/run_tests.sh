#!/bin/bash

# Minimal-Todo Test Automation Run Script
# This script helps run the test suite on Unix/Linux/Mac

set -e

echo "=========================================="
echo "Minimal-Todo Test Automation"
echo "=========================================="
echo ""

# Check if robot framework is installed
if ! python3 -m robot --version &> /dev/null; then
    echo "ERROR: Robot Framework not installed"
    echo "Install with: pip install -r requirements.txt"
    exit 1
fi

echo "Select test execution option:"
echo "1. Run all tests"
echo "2. Run only Positive tests"
echo "3. Run only Negative tests"
echo "4. Run Add Todo tests"
echo "5. Run Mark Done tests"
echo "6. Run Delete tests"
echo "7. Run Reminder tests"
echo "8. Run Night Mode tests"
echo ""

read -p "Enter option (1-8): " option

case $option in
    1)
        echo "Running all tests..."
        robot -d results tests/
        ;;
    2)
        echo "Running Positive tests..."
        robot -d results -i Positive tests/
        ;;
    3)
        echo "Running Negative tests..."
        robot -d results -i Negative tests/
        ;;
    4)
        echo "Running Add Todo tests..."
        robot -d results tests/test_add_todo.robot
        ;;
    5)
        echo "Running Mark Done tests..."
        robot -d results tests/test_mark_done.robot
        ;;
    6)
        echo "Running Delete tests..."
        robot -d results tests/test_delete_todo.robot
        ;;
    7)
        echo "Running Reminder tests..."
        robot -d results tests/test_reminder.robot
        ;;
    8)
        echo "Running Night Mode tests..."
        robot -d results tests/test_night_mode.robot
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

echo ""
echo "Test execution completed!"
echo "Results are in the 'results' folder"
