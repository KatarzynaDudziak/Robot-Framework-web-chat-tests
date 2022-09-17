*** Settings ***
Test Setup         keywords.Open Browser
Test Teardown      Close Browser
Resource           ../keywords.resource
Test Template      Checking Register Page With Invalid Data


*** Test Cases ***                     USERNAME               PASSWORD1                    PASSWORD2                      EMAIL
Register With Too Short Data           aa                     11                           11                             bb
Register With Empty Username           ${EMPTY}               ${REGISTER_PASSWORD}         ${REGISTER_PASSWORD}           ${REGISTER_EMAIL}
Register With Empty Password           tester1                ${EMPTY}                     ${EMPTY}                       ${REGISTER_EMAIL}
Register Without Repeat Password       tester2                ${REGISTER_PASSWORD}         ${EMPTY}                       ${REGISTER_EMAIL}
Register Without Data                  ${EMPTY}               ${EMPTY}                     ${EMPTY}                       ${EMPTY}
