*** Settings ***
Library             AppiumLibrary       timeout=60
Library             OperatingSystem
Library             String
Library             Process
Library             Collections
Library             EyesLibrary         runner=mobile_native        config=${CURDIR}/applitools.yaml
Test Setup          Open Test Application
Test Teardown       Close Application

*** Keywords ***
Open Test Application
    Open Application    http://localhost:4723/wd/hub
    ...                 platformVersion=12
    ...                 platformName=Android
    ...                 deviceName=RXCRC012L5A
    ...                 app=${CURDIR}/app/twp.apk
    ...                 name=Test
    ...                 automationName=UIAutomator2

*** Test Cases ***
App should be visible 1
    Eyes Open           ${TEST NAME}       host_os=Android     match_level=LAYOUT
    Swipe By Percent    95    50    10    50
    Eyes Check Window       Fully
    Eyes Check Window       Again
    Eyes Close Async