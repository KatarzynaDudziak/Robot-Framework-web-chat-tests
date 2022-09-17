*** Settings ***
Test Setup         keywords.Open Browser
Test Teardown      Close Browser
Test Template      Checking Login Page
Resource           ../keywords.resource


*** Test Cases ***                USERNAME               PASSWORD                 URL
Valid Username And Password       ${VALID_USERNAME}      ${VALID_PASSWORD}        ${MAIN_URL}
Invalid Username And Password     ${INVALID_USERNAME}    ${INVALID_PASSWORD}      ${FAILED_LOGIN_URL}
Invalid Username                  ${INVALID_USERNAME}    ${VALID_PASSWORD}        ${FAILED_LOGIN_URL}
Invalid Password                  ${VALID_USERNAME}      ${INVALID_PASSWORD}      ${FAILED_LOGIN_URL}
Empty Username And Password       ${EMPTY}               ${EMPTY}                 ${FAILED_LOGIN_URL}
Empty Username                    ${EMPTY}               ${VALID_PASSWORD}        ${FAILED_LOGIN_URL}
Empty Password                    ${VALID_USERNAME}      ${EMPTY}                 ${FAILED_LOGIN_URL}
