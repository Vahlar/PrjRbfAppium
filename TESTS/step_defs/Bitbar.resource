*** Settings ***

Resource            %{PROJECT_FOLDER}/SOCLE/Framework.resource

*** Variables ***

${TIMEOUT}                                    5 seconds
${RETRY}                                      1s

#BITBAR variables
${NAME}                                       Nicolas
${RIGHT_ANSWER}                               You are right!
${RIGHT_ANSWER_DETAILED}                      Congratulations ${NAME}!
${WRONG_ANSWER}                               Wrong Answer!
${WRONG_ANSWER_DETAILED}                      Haven't you heard about Testdroid Cloud?

#BITBAR Locators
${LOCATOR_RADIO_BITBAR}                       ${EMPTY}
${LOCATOR_EDIT_TEXT_BITBAR}                   //*[@resource-id="com.bitbar.testdroid:id/editText1"]
${LOCATOR_BUTTON_ANSWER_BITBAR}               //*[@resource-id="com.bitbar.testdroid:id/button1"]
${LOCATOR_ANSWER_BITBAR}                      //*[@resource-id="com.bitbar.testdroid:id/textView1"]
${LOCATOR_DETAILED_ANSWER_BITBAR}             //*[@resource-id="com.bitbar.testdroid:id/textView2"]

*** Keywords ***
verifier formulaire
    [Arguments]    ${INDEX}

    ${LOCATOR_RADIO_BITBAR}    set Variable    //*[@resource-id="com.bitbar.testdroid:id/radio${INDEX}"]

    #desactivate keyboard
    AppiumLibrary.Hide Keyboard

    #select radio button
    AppiumLibrary.Click Element    ${LOCATOR_RADIO_BITBAR}

    #type name
    AppiumLibrary.Input Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #verify name
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_EDIT_TEXT_BITBAR}    ${NAME}

    #answer validation
    AppiumLibrary.Click Element    ${LOCATOR_BUTTON_ANSWER_BITBAR}

    #verify answer
    IF    ${INDEX} == 1

        Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_ANSWER_BITBAR}    ${RIGHT_ANSWER}
        Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_DETAILED_ANSWER_BITBAR}    ${RIGHT_ANSWER_DETAILED}
    ELSE
        
        Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_ANSWER_BITBAR}    ${WRONG_ANSWER}
        Wait Until Keyword Succeeds    ${TIMEOUT}    ${RETRY}    AppiumLibrary.Element Should Contain Text    ${LOCATOR_DETAILED_ANSWER_BITBAR}    ${WRONG_ANSWER_DETAILED}
    END
