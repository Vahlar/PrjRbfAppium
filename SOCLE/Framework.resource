*** Settings ***
Library             AppiumLibrary
Library             SeleniumLibrary
Library             OperatingSystem
Resource            Driver.resource


*** Variables ***
# Android | IOS
${platform}    ${EMPTY}

*** Keywords ***
Suite Setup
    BuiltIn.Log To Console    **Suite Setup**
    ${system}    BuiltIn.Evaluate    platform.system()    platform
    ${platform}    Set Variable If
    ...    '${system}'=='Darwin'    IOS
    ...    Android
    BuiltIn.Set Global Variable    ${platform}

Test Setup
    BuiltIn.Log To Console    \n**Test Setup**

    #Ne fonctionne pas si ${platform} = IOS
    run keyword if  'BITBAR' in $test_tags
    ...    Open Application ${platform}    ${appPackageBitbar}    ${appActivityBitbar}

    run keyword if  'API' in $test_tags
    ...    Open Application ${platform}    ${appPackageApi}    ${appActivityApi}

    #Run Keyword    Open Application ${platform}

TestTeardown
    BuiltIn.Log To Console    **Test Teardown**
    IF    '${TEST STATUS}'=='FAIL'
        ${dom}    AppiumLibrary.Get Source
        OperatingSystem.Create File    path=${OUTPUT DIR}${/}${TEST NAME}_FAIL.xml    content=${dom}    encoding=UTF-8
        AppiumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}${TEST NAME}_FAIL.png
    END
    AppiumLibrary.Close Application

suiteTeardown
    BuiltIn.Log To Console    **Suite Teardown**
