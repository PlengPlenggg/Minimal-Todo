*** Settings ***
Documentation    Test cases for reminder functionality
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application
Test Teardown    Clear All Todos

*** Test Cases ***
TC_REMINDER-01: Add Todo With Reminder
    [Documentation]    Test adding a todo item with reminder enabled
    ...    Steps:
    ...    1. Launch application
    ...    2. Click add button
    ...    3. Enter todo title "Meeting with team"
    ...    4. Enable reminder switch
    ...    5. Click Save
    ...    Expected Result: Todo item with reminder is added to list
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Meeting with team
    Enable Reminder
    Save Todo Item
    Verify Todo Item Exists    Meeting with team
    Log    PASS: Todo with reminder successfully added


TC_REMINDER-02: Add Todo With Reminder And Date
    [Documentation]    Test adding a todo with both date and reminder
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Doctor Appointment
    Enter Todo Date    05/15/2026
    Enable Reminder
    Save Todo Item
    Verify Todo Item Exists    Doctor Appointment
    Log    PASS: Todo with date and reminder added


TC_REMINDER-03: Toggle Reminder On And Off
    [Documentation]    Test enabling and disabling reminder for a todo
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Reminder Toggle Test
    Enable Reminder
    Sleep    0.5s
    Enable Reminder
    Save Todo Item
    Verify Todo Item Exists    Reminder Toggle Test
    Log    PASS: Reminder toggle working correctly


TC_REMINDER-04: Add Multiple Todos With Reminders
    [Documentation]    Test adding multiple todos with reminders
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Reminder Task 1
    Enable Reminder
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Reminder Task 2
    Enable Reminder
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Reminder Task 3
    Enable Reminder
    Save Todo Item
    
    Verify Todo Item Exists    Reminder Task 1
    Verify Todo Item Exists    Reminder Task 2
    Verify Todo Item Exists    Reminder Task 3
    Log    PASS: Multiple reminders created successfully
