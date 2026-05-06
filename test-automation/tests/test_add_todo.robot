*** Settings ***
Documentation    Test cases for adding new todo items
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application
Test Teardown    Clear All Todos

*** Test Cases ***
TC_ADD-01: Add New Todo Item Successfully
    [Documentation]    Test adding a new todo item with title
    ...    Steps:
    ...    1. Launch application
    ...    2. Click on add button
    ...    3. Enter todo title "Buy groceries"
    ...    4. Click Save button
    ...    Expected Result: New todo item appears in the todo list
    
    Click Add Todo Button
    Enter Todo Title    Buy groceries
    Save Todo Item
    Verify Todo Item Exists    Buy groceries
    Log    PASS: Todo item 'Buy groceries' successfully added


TC_ADD-02: Add Todo Item With Special Characters
    [Documentation]    Test adding a todo with special characters
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Buy items @ store #1
    Save Todo Item
    Verify Todo Item Exists    Buy items @ store #1
    Log    PASS: Todo with special characters added successfully


TC_ADD-03: Add Multiple Todo Items
    [Documentation]    Test adding multiple todo items
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    First Todo
    Save Todo Item
    Verify Todo Item Exists    First Todo
    
    Click Add Todo Button
    Enter Todo Title    Second Todo
    Save Todo Item
    Verify Todo Item Exists    Second Todo
    
    Click Add Todo Button
    Enter Todo Title    Third Todo
    Save Todo Item
    Verify Todo Item Exists    Third Todo
    Log    PASS: All three todo items added successfully
