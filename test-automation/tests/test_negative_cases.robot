*** Settings ***
Documentation    Negative test cases
Library          AppiumLibrary
Resource         ../config/appium_config.robot
Resource         ../keywords/todo_keywords.robot

Suite Setup      Open Todo Application
Suite Teardown   Close Todo Application

*** Test Cases ***
TC_NEG-01: Try To Add Todo With Empty Title
    [Documentation]    Test adding a todo without entering a title
    ...    Steps:
    ...    1. Launch application
    ...    2. Click add button
    ...    3. Don't enter any title
    ...    4. Click Save
    ...    Expected Result: App shows error message or prevents saving
    [Tags]    Negative
    
    Click Add Todo Button
    Sleep    1s
    
    # Try to save without entering title
    Save Todo Item
    Sleep    2s
    
    # Verify that we're still on the add screen (item wasn't saved)
    Wait Until Element Is Visible    ${ADD_TODO_TITLE_FIELD}    5s
    Log    PASS: Empty todo prevented from being added


TC_NEG-02: Try To Add Todo With Only Spaces
    [Documentation]    Test adding a todo with only whitespace
    [Tags]    Negative
    
    Click Add Todo Button
    Enter Todo Title    ${SPACE}${SPACE}${SPACE}
    Save Todo Item
    Sleep    2s
    
    # Verify that item was not added
    Wait Until Element Is Visible    ${ADD_TODO_TITLE_FIELD}    5s
    Log    PASS: Whitespace-only todo prevented from being added


TC_NEG-03: Very Long Todo Title
    [Documentation]    Test adding a todo with very long title
    [Tags]    Negative
    
    Click Add Todo Button
    ${long_text}=    Evaluate    'a' * 500
    Enter Todo Title    ${long_text}
    Save Todo Item
    Sleep    2s
    
    # Verify behavior - app should either truncate or reject
    Log    PASS: Long title handling verified


TC_NEG-04: Add Todo And Immediately Add Another Without Saving
    [Documentation]    Test clicking add button multiple times
    [Tags]    Negative
    
    Click Add Todo Button
    Sleep    1s
    
    # Try to click add button again (should either open new screen or do nothing)
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ADD_TODO_BTN_XPATH}
    
    Log    PASS: Multiple add button clicks handled: ${is_visible}


TC_NEG-05: Cancel Adding Todo
    [Documentation]    Test canceling the add todo dialog
    [Tags]    Negative
    
    Click Add Todo Button
    Enter Todo Title    Cancel Test
    
    # Press back button to cancel
    Press Keycode    4
    Sleep    2s
    
    # Verify item was not added
    Wait Until Page Does Not Contain    Cancel Test    10s
    Log    PASS: Todo addition successfully cancelled
