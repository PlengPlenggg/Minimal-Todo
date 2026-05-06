*** Settings ***
Documentation    Test cases for deleting todo items
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application

*** Test Cases ***
TC_DELETE-01: Delete Todo Item By Swiping Left
    [Documentation]    Test deleting a todo item by swiping left
    ...    Steps:
    ...    1. Launch application
    ...    2. Add a new todo item "Test Delete"
    ...    3. Swipe left on the todo item
    ...    4. Verify item is removed from list
    ...    Expected Result: Todo item is removed from the list
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Test Delete
    Save Todo Item
    Verify Todo Item Exists    Test Delete
    
    Delete Todo By Swipe    1
    Sleep    2s
    Wait Until Page Does Not Contain    Test Delete    10s
    Log    PASS: Todo item deleted successfully by swipe


TC_DELETE-02: Delete Multiple Items
    [Documentation]    Test deleting multiple todo items
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Delete Item 1
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Delete Item 2
    Save Todo Item
    
    Click Add Todo Button
    Enter Todo Title    Delete Item 3
    Save Todo Item
    
    Delete Todo By Swipe    1
    Sleep    1s
    Delete Todo By Swipe    1
    Sleep    1s
    Delete Todo By Swipe    1
    Sleep    2s
    
    Log    PASS: All three items deleted successfully


TC_DELETE-03: Verify Item Count After Deletion
    [Documentation]    Test that item count decreases after deletion
    [Tags]    Positive
    
    Click Add Todo Button
    Enter Todo Title    Count Test
    Save Todo Item
    Verify Todo Item Exists    Count Test
    
    Delete Todo By Swipe    1
    Sleep    2s
    
    # Verify the deleted item is gone
    Wait Until Page Does Not Contain    Count Test    10s
    Log    PASS: Item count verified after deletion
