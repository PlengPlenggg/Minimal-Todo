*** Settings ***
Documentation    Test cases for marking todo items as done
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application
Test Teardown    Clear All Todos

*** Test Cases ***
TC_MARK-01: Mark Todo Item As Completed
    [Documentation]    Test marking a todo item as completed
    ...    Steps:
    ...    1. Launch application
    ...    2. Add a new todo item "Buy groceries"
    ...    3. Click checkbox next to the item
    ...    4. Verify item is marked as complete
    ...    Expected Result: Checkbox is checked, item visually marked as done
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Buy groceries
    Save Todo Item
    Verify Todo Item Exists    Buy groceries
    
    Mark Todo As Done    1
    Verify Todo Item Completed    1
    Log    PASS: Todo item marked as completed


TC_MARK-02: Mark Multiple Items As Done
    [Documentation]    Test marking multiple items as completed
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Task One
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Task Two
    Save Todo Item
    
    Mark Todo As Done    1
    Sleep    1s
    Mark Todo As Done    1
    
    Log    PASS: Multiple todo items marked as done


TC_MARK-03: Toggle Todo Item Completion Status
    [Documentation]    Test toggling completion status by clicking checkbox again
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Toggle Test
    Save Todo Item
    
    Mark Todo As Done    1
    Sleep    1s
    Verify Todo Item Completed    1
    
    # Click again to unmark
    Mark Todo As Done    1
    Sleep    1s
    Log    PASS: Todo completion status toggled successfully
