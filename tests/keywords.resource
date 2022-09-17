*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${MAIN_URL}             http://127.0.0.1:8000/
${REGISTER_URL}         http://127.0.0.1:8000/user/register/
${LOGIN_URL}            http://127.0.0.1:8000/user/login/
${FAILED_LOGIN_URL}     http://127.0.0.1:8000/user/login/?next=/
${BROWSER}              Chrome
${CHROMEDRIVER_PATH}    /usr/bin/chromedriver
${VALID_USERNAME}       Tester
${VALID_PASSWORD}       robottest
${INVALID_USERNAME}     invalidusername
${INVALID_PASSWORD}     invalidpassword
${REGISTER_PASSWORD}    robottest
${REGISTER_EMAIL}       tester@ll.pl


*** Keywords ***
Open Browser
    ${chrome options} =     Evaluate    selenium.webdriver.ChromeOptions()
 
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    to_capabilities
 
    Create Webdriver    driver_name=${BROWSER}   alias=google   chrome_options=${chrome_options}

Checking Login Page
    [Arguments]           ${username}    ${password}    ${url}

    Go To                 ${MAIN_URL}
    Input Text            username       ${username}
    Input Password        password1      ${password}
    Click Button          Login
    Location Should Be    ${url}

Checking Register Page With Invalid Data
    [Arguments]           ${username}    ${password1}    ${password2}    ${email}

    Go To                 ${REGISTER_URL}
    Input Text            username        ${username}
    Input Text            email           ${email}
    Input Password        password1       ${password1}
    Input Password        password2       ${password2}
    Click Button          Register
    Location Should Be    ${REGISTER_URL}

Checking Sending Message
    [Arguments]            ${content}

    Checking Login Page                   ${VALID_USERNAME}    ${VALID_PASSWORD}    ${MAIN_URL}
    Input Text             content        ${content}
    Click Button           Send
