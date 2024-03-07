*** Settings ***
Resource            %{PROJECT_FOLDER}/SOCLE/Framework.resource
Suite Setup         Framework.suiteSetup
Suite Teardown      Framework.suiteTeardown
Test Setup          Framework.testSetup
Test Teardown       Framework.testTeardown

*** Variables ***

${TIMEOUT}                                    5 seconds
${RETRY}                                      1s

${NAME}                                       Nicolas
${RIGHT_ANSWER}                               You are right!
${RIGHT_ANSWER_DETAILED}                      Congratulations ${NAME}!
${WRONG_ANSWER}                               Wrong Answer!
${WRONG_ANSWER_DETAILED}                      Haven't you heard about Testdroid Cloud?

${TEXT}                                       (And all inside of a ScrollView!)

#BITBAR Locators
${LOCATOR_RADIO_BITBAR_0}                     //*[@resource-id="com.bitbar.testdroid:id/radio0"]
${LOCATOR_RADIO_BITBAR_1}                     //*[@resource-id="com.bitbar.testdroid:id/radio1"]
${LOCATOR_RADIO_BITBAR_2}                     //*[@resource-id="com.bitbar.testdroid:id/radio2"]
${LOCATOR_EDIT_TEXT_BITBAR}                   //*[@resource-id="com.bitbar.testdroid:id/editText1"]
${LOCATOR_BUTTON_ANSWER_BITBAR}               //*[@resource-id="com.bitbar.testdroid:id/button1"]
${LOCATOR_ANSWER_BITBAR}                      //*[@resource-id="com.bitbar.testdroid:id/textView1"]
${LOCATOR_DETAILED_ANSWER_BITBAR}             //*[@resource-id="com.bitbar.testdroid:id/textView2"]

#API Locators
${LOCATOR_ACCEPT_API}                         //*[@resource-id="com.android.permissioncontroller:id/continue_button"]
${LOCATOR_ACCEPT_ANDROID}                     //*[@resource-id="android:id/button1"]
${LOCATOR_VIEWS_API}                          //*[@content-desc="Views"]
${LOCATOR_CONTROLS_API}                       //*[@content-desc="Controls"]
${LOCATOR_THEME_API}                          //*[@content-desc="2. Dark Theme"]

${LOCATOR_START_SCROLL_API}                   //*[@resource-id="io.appium.android.apis:id/edit"]
${LOCATOR_END_SCROLL_API}                     //*[@content-desc="textColorPrimary"]
${LOCATOR_TEXT_API}                           //*[@content-desc="(And all inside of a ScrollView!)"]

*** Test Cases ***
Test Case BUY 101 DEVICES
    [Documentation]    Test Case BUY 101 DEVICES
    [Tags]    TestCaseBuy101Devices    BITBAR
    Log    Ouverture de l'app

    #desactivate keyboard
    AppiumLibrary.Hide Keyboard
    
    #select radio button
    AppiumLibrary.Click Element    ${LOCATOR_RADIO_BITBAR_0}

    #type name
    AppiumLibrary.Input Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #verify name
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #answer validation
    AppiumLibrary.Click Element    ${LOCATOR_BUTTON_ANSWER_BITBAR}

    #verify answer
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_ANSWER_BITBAR}    ${WRONG_ANSWER}
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_DETAILED_ANSWER_BITBAR}    ${WRONG_ANSWER_DETAILED}

    
Test Case USE TESTDROID CLOUD
    [Documentation]    Test Case USE TESTDROID CLOUD
    [Tags]    TestCaseUseTestdroidCloud    BITBAR
    Log    Ouverture de l'app

    #desactivate keyboard
    AppiumLibrary.Hide Keyboard

    #select radio button
    AppiumLibrary.Click Element    ${LOCATOR_RADIO_BITBAR_1}

    #type name
    AppiumLibrary.Input Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #verify name
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #answer validation
    AppiumLibrary.Click Element    ${LOCATOR_BUTTON_ANSWER_BITBAR}

    #verify answer
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_ANSWER_BITBAR}    ${RIGHT_ANSWER}
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_DETAILED_ANSWER_BITBAR}    ${RIGHT_ANSWER_DETAILED}

Test Case ASK MOM FOR HELP
    [Documentation]    Test Case ASK MOM FOR HELP
    [Tags]    TestCaseAskMomForHelp    BITBAR
    Log    Ouverture de l'app
    
    #desactivate keyboard
    AppiumLibrary.Hide Keyboard

    #select radio button
    AppiumLibrary.Click Element    ${LOCATOR_RADIO_BITBAR_2}

    #type name
    AppiumLibrary.Input Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #verify name
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #answer validation
    AppiumLibrary.Click Element    ${LOCATOR_BUTTON_ANSWER_BITBAR}

    #verify answer
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_ANSWER_BITBAR}    ${WRONG_ANSWER}
    Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_DETAILED_ANSWER_BITBAR}    ${WRONG_ANSWER_DETAILED}

Test Case API DEMO
    [Documentation]    Test Case API DEMO
    [Tags]    TestCaseAPIDemo    API
    Log    Ouverture de l'app

    #accept button
    AppiumLibrary.Click Element    ${LOCATOR_ACCEPT_API}

    #accept popup
    AppiumLibrary.Wait Until Element Is Visible    ${LOCATOR_ACCEPT_ANDROID}
    AppiumLibrary.Click Element    ${LOCATOR_ACCEPT_ANDROID}

    #go to dark theme
    AppiumLibrary.Click Element    ${LOCATOR_VIEWS_API}
    AppiumLibrary.Click Element    ${LOCATOR_CONTROLS_API}
    AppiumLibrary.Click Element    ${LOCATOR_THEME_API}

    #desactivate keyboard
    AppiumLibrary.Hide Keyboard

    #scroll to text
    AppiumLibrary.Scroll    ${LOCATOR_END_SCROLL_API}    ${LOCATOR_START_SCROLL_API}

    #verify text
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_TEXT_API}    ${TEXT}

*** Keywords ***
