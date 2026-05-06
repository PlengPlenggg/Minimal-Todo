*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}           http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}           Android
${PLATFORM_VERSION}        11
${DEVICE_NAME}             emulator-5554
${APP_PACKAGE}             com.example.avjindersinghsekhon.minimaltodo
${APP_ACTIVITY}            com.example.avjindersinghsekhon.minimaltodo.Main.MainActivity
${AUTOMATION_NAME}         UiAutomator2
${AUTO_GRANT_PERMISSIONS}  true
${NO_RESET}                false

*** Keywords ***
Open Todo Application
    [Documentation]    Opens the Minimal-Todo application
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}
    ...    noReset=${NO_RESET}
    Sleep    2s

Close Todo Application
    [Documentation]    Closes the application
    Close Application

Restart Application
    [Documentation]    Restarts the application
    Close Application
    Sleep    1s
    Open Todo Application
