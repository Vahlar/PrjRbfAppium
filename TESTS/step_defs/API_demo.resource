*** Settings ***

Resource            %{PROJECT_FOLDER}/SOCLE/Framework.resource

*** Variables ***

${TIMEOUT}                                    5 seconds
${RETRY}                                      1s

#API variables
${TEXT}                                       (And all inside of a ScrollView!)

#API Locators
${LOCATOR_ACCEPT_API}                         //*[@resource-id="com.android.permissioncontroller:id/continue_button"]
${LOCATOR_ACCEPT_ANDROID}                     //*[@resource-id="android:id/button1"]
${LOCATOR_VIEWS_API}                          //*[@content-desc="Views"]
${LOCATOR_CONTROLS_API}                       //*[@content-desc="Controls"]
${LOCATOR_THEME_API}                          //*[@content-desc="2. Dark Theme"]

${LOCATOR_CHECKBOX_API_1}                     //*[@content-desc="Checkbox 1"]
${LOCATOR_CHECKBOX_API_2}                     //*[@content-desc="Checkbox 2"]
${LOCATOR_RADIO_API}                          //*[@content-desc="RadioButton 1"]
${LOCATOR_TOGGLE_API_1}                       //*[@resource-id="io.appium.android.apis:id/toggle1"]
${LOCATOR_TOGGLE_API_2}                       //*[@resource-id="io.appium.android.apis:id/toggle2"]
${LOCATOR_SPINNER_API}                        //*[@resource-id="io.appium.android.apis:id/spinner1"]
${LOCATOR_URANUS_API}                         //*[@resource-id="android:id/text1" and @text="Uranus"]

${LOCATOR_START_SCROLL_API}                   //*[@resource-id="io.appium.android.apis:id/edit"]
${LOCATOR_END_SCROLL_API}                     //*[@content-desc="textColorPrimary"]
${LOCATOR_TEXT_API}                           //*[@content-desc="(And all inside of a ScrollView!)"]

*** Keywords ***

faire des trucs sur le dark theme

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

    #activate all the stuff
    AppiumLibrary.Click Element    ${LOCATOR_CHECKBOX_API_1}
    AppiumLibrary.Click Element    ${LOCATOR_CHECKBOX_API_2}
    AppiumLibrary.Click Element    ${LOCATOR_RADIO_API}
    AppiumLibrary.Click Element    ${LOCATOR_TOGGLE_API_1}
    AppiumLibrary.Click Element    ${LOCATOR_TOGGLE_API_2}
    AppiumLibrary.Click Element    ${LOCATOR_SPINNER_API}
    AppiumLibrary.Wait Until Page Contains Element    ${LOCATOR_URANUS_API}
    AppiumLibrary.Click Element    ${LOCATOR_URANUS_API}

    #scroll to text
    AppiumLibrary.Scroll    ${LOCATOR_END_SCROLL_API}    ${LOCATOR_START_SCROLL_API}

    #verify text
    AppiumLibrary.Element Should Contain Text    ${LOCATOR_TEXT_API}    ${TEXT}