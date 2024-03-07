*** Settings ***
Library     AppiumLibrary
Resource    %{PROJECT_FOLDER}/TESTS/conf/AppCapabilities.resource


*** Variables ***
${appiumServer}     http://localhost:4723/wd/hub


*** Keywords ***
Open Application Android
    [Arguments]    ${appPackage}    ${appActivity}
    AppiumLibrary.Open Application
    ...    ${appiumServer}
    ...    automationName=uiautomator2
    ...    platformName=Android
    ...    deviceName=Android
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
#    ...    autoGrantPermissions=${True}

#Open Application Android
#    AppiumLibrary.Open Application
#    ...    ${appiumServer}
#    ...    automationName=uiautomator2
#    ...    platformName=Android
#    ...    deviceName=Android
#    ...    appPackage=${appPackage}
#    ...    appActivity=${appActivity}
#    ...    unicodeKeyboard=${True}
#    ...    resetKeyboard=${True}

Open Application IOS
    AppiumLibrary.Open Application
    ...    ${appiumServer}
    ...    automationName=XCUITest
    ...    platformName=iOS
    ...    deviceName=iPhone
    ...    bundleId=${bundleId}
