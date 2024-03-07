*** Settings ***
#Resource            %{PROJECT_FOLDER}/SOCLE/Framework.resource
Resource            %{PROJECT_FOLDER}/TESTS/step_defs/Bitbar.resource
Resource            %{PROJECT_FOLDER}/TESTS/step_defs/API_demo.resource
Suite Setup         Framework.suiteSetup
Suite Teardown      Framework.suiteTeardown
Test Setup          Framework.testSetup
Test Teardown       Framework.testTeardown

*** Variables ***

*** Test Cases ***
Test Case BUY 101 DEVICES
    [Documentation]    Test Case BUY 101 DEVICES
    [Tags]    TestCaseBuy101Devices    BITBAR
    Log    Ouverture de l'app

    Bitbar.verifier formulaire    0

    
Test Case USE TESTDROID CLOUD
    [Documentation]    Test Case USE TESTDROID CLOUD
    [Tags]    TestCaseUseTestdroidCloud    BITBAR
    Log    Ouverture de l'app

    Bitbar.verifier formulaire    1

Test Case ASK MOM FOR HELP
    [Documentation]    Test Case ASK MOM FOR HELP
    [Tags]    TestCaseAskMomForHelp    BITBAR
    Log    Ouverture de l'app
    
    Bitbar.verifier formulaire    2

Test Case API DEMO
    [Documentation]    Test Case API DEMO
    [Tags]    TestCaseAPIDemo    API
    Log    Ouverture de l'app

    API_demo.faire des trucs sur le dark theme

*** Keywords ***
