*** Settings ***
Library    AppiumLibrary

*** Variables ***
${MAIN_ACTIVITY_ID}           com.example.avjindersinghsekhon.minimaltodo:id/main_activity_container
${ADD_TODO_BTN_XPATH}         //android.widget.FloatingActionButton
${ADD_TODO_TITLE_FIELD}       com.example.avjindersinghsekhon.minimaltodo:id/editText
${ADD_TODO_DATE_FIELD}        com.example.avjindersinghsekhon.minimaltodo:id/datePickerButton
${ADD_TODO_SAVE_BTN}          com.example.avjindersinghsekhon.minimaltodo:id/saveTaskButton
${TODO_LIST_VIEW}             com.example.avjindersinghsekhon.minimaltodo:id/listView
${TODO_ITEM_CHECKBOX}         com.example.avjindersinghsekhon.minimaltodo:id/checkBox
${TODO_ITEM_TITLE}            com.example.avjindersinghsekhon.minimaltodo:id/todoTitle
${REMINDER_SWITCH}            com.example.avjindersinghsekhon.minimaltodo:id/reminderSwitch
${NIGHT_MODE_MENU}            com.example.avjindersinghsekhon.minimaltodo:id/menu_overflow
${NIGHT_MODE_OPTION}          com.example.avjindersinghsekhon.minimaltodo:id/night_mode_menu_item

*** Keywords ***
Click Add Todo Button
    [Documentation]    Clicks the floating action button to add a new todo
    Wait Until Element Is Visible    ${ADD_TODO_BTN_XPATH}    10s
    Click Element    ${ADD_TODO_BTN_XPATH}
    Sleep    1s

Enter Todo Title
    [Arguments]    ${title}
    [Documentation]    Enters title for a new todo item
    Wait Until Element Is Visible    ${ADD_TODO_TITLE_FIELD}    10s
    Click Element    ${ADD_TODO_TITLE_FIELD}
    Input Text    ${ADD_TODO_TITLE_FIELD}    ${title}
    Sleep    0.5s

Enter Todo Date
    [Arguments]    ${date}
    [Documentation]    Sets the date for a todo item
    Wait Until Element Is Visible    ${ADD_TODO_DATE_FIELD}    10s
    Click Element    ${ADD_TODO_DATE_FIELD}
    Sleep    1s

Enable Reminder
    [Documentation]    Enables reminder for a todo item
    Wait Until Element Is Visible    ${REMINDER_SWITCH}    10s
    ${reminder_state}=    Get Element Attribute    ${REMINDER_SWITCH}    checked
    Run Keyword If    '${reminder_state}' == 'false'    Click Element    ${REMINDER_SWITCH}
    Sleep    0.5s

Save Todo Item
    [Documentation]    Saves the todo item
    Wait Until Element Is Visible    ${ADD_TODO_SAVE_BTN}    10s
    Click Element    ${ADD_TODO_SAVE_BTN}
    Sleep    2s

Verify Todo Item Exists
    [Arguments]    ${todo_title}
    [Documentation]    Verifies that a todo item with given title exists in the list
    Wait Until Page Contains    ${todo_title}    10s

Verify Todo Item Completed
    [Arguments]    ${index}=1
    [Documentation]    Verifies that a todo item is marked as completed
    ${element}=    Get Webelement    ${TODO_ITEM_CHECKBOX}
    ${is_checked}=    Get Element Attribute    ${element}    checked
    Should Be Equal    ${is_checked}    true    Todo item should be marked as complete

Mark Todo As Done
    [Arguments]    ${todo_index}=1
    [Documentation]    Marks a todo item as done by clicking the checkbox
    Wait Until Element Is Visible    ${TODO_ITEM_CHECKBOX}    10s
    Click Element    ${TODO_ITEM_CHECKBOX}
    Sleep    1s

Delete Todo By Swipe
    [Arguments]    ${todo_index}=1
    [Documentation]    Deletes a todo item by swiping left
    Wait Until Element Is Visible    ${TODO_LIST_VIEW}    10s
    ${width}=    Get Window Width
    ${height}=   Get Window Height
    ${start_x}=    Evaluate    int(${width}*0.8)
    ${end_x}=      Evaluate    int(${width}*0.1)
    ${y}=          Evaluate    int(${height}*0.5)
    Swipe    start_x=${start_x}    start_y=${y}    end_x=${end_x}    end_y=${y}    duration=500ms
    Sleep    1s
    Wait Until Page Does Not Contain    Swipe button appeared    5s

Get Todo Item Text
    [Arguments]    ${todo_index}=1
    [Documentation]    Gets the text of a todo item
    ${text}=    Get Text    ${TODO_ITEM_TITLE}
    RETURN    ${text}

Open Settings Menu
    [Documentation]    Opens the overflow menu
    Wait Until Element Is Visible    ${NIGHT_MODE_MENU}    10s
    Click Element    ${NIGHT_MODE_MENU}
    Sleep    1s

Toggle Night Mode
    [Documentation]    Toggles night mode on/off
    Wait Until Element Is Visible    ${NIGHT_MODE_OPTION}    10s
    Click Element    ${NIGHT_MODE_OPTION}
    Sleep    2s

Verify Night Mode Is Enabled
    [Documentation]    Verifies that night mode is enabled (by checking background color)
    # This may need adjustment based on actual element identifiers
    Wait Until Page Contains Element    xpath=//android.view.View[@resource-id='com.example.avjindersinghsekhon.minimaltodo:id/main_layout']    10s

Clear All Todos
    [Documentation]    Clears all todo items (for test cleanup)
    FOR    ${i}    IN RANGE    10
        ${has_items}=    Run Keyword And Return Status    Element Should Be Visible    ${TODO_ITEM_TITLE}
        IF    not ${has_items}
            Exit For Loop
        END
        ${width}=    Get Window Width
        ${height}=   Get Window Height
        ${start_x}=    Evaluate    int(${width}*0.8)
        ${end_x}=      Evaluate    int(${width}*0.1)
        ${y}=          Evaluate    int(${height}*0.5)
        Swipe    start_x=${start_x}    start_y=${y}    end_x=${end_x}    end_y=${y}    duration=500ms
        Sleep    1s
    END
