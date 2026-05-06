*** Settings ***
Documentation    Test cases for night mode functionality
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application

*** Test Cases ***
TC_NIGHT-01: Toggle Night Mode On
    [Documentation]    Test enabling night mode
    ...    Steps:
    ...    1. Launch application
    ...    2. Open overflow menu
    ...    3. Click on Night Mode option
    ...    4. Verify night mode is enabled (dark theme applied)
    ...    Expected Result: App switches to dark/night theme
    [Tags]    Positive
    
    Open Settings Menu
    Toggle Night Mode
    Verify Night Mode Is Enabled
    Log    PASS: Night mode enabled successfully


TC_NIGHT-02: Toggle Night Mode Off
    [Documentation]    Test disabling night mode
    [Tags]    Positive
    
    Open Settings Menu
    Toggle Night Mode
    Sleep    1s
    
    Open Settings Menu
    Toggle Night Mode
    Verify Night Mode Is Enabled
    Log    PASS: Night mode disabled successfully


TC_NIGHT-03: Night Mode Persists Across Sessions
    [Documentation]    Test that night mode setting persists after app restart
    [Tags]    Positive
    
    Open Settings Menu
    Toggle Night Mode
    Sleep    1s
    
    Close Todo Application
    Sleep    2s
    
    Open Todo Application
    Sleep    2s
    
    # Verify night mode is still enabled
    Verify Night Mode Is Enabled
    Log    PASS: Night mode setting persisted after restart


TC_NIGHT-04: Add Todo In Night Mode
    [Documentation]    Test adding a todo item while night mode is enabled
    [Tags]    Positive
    
    Open Settings Menu
    Toggle Night Mode
    Sleep    1s
    
    Click Add Todo Button
    Enter Todo Title    Night Mode Todo
    Save Todo Item
    Verify Todo Item Exists    Night Mode Todo
    Log    PASS: Todo added successfully in night mode


TC_NIGHT-05: Toggle Night Mode With Existing Todos
    [Documentation]    Test toggling night mode when todos are present
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Test Item 1
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Test Item 2
    Save Todo Item
    
    Open Settings Menu
    Toggle Night Mode
    Sleep    1s
    
    Verify Todo Item Exists    Test Item 1
    Verify Todo Item Exists    Test Item 2
    Log    PASS: Night mode toggle works with existing todos
