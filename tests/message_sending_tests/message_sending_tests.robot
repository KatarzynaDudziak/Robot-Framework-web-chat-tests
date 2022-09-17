*** Settings ***
Resource         ../keywords.resource
Test Setup       keywords.Open Browser
Test Teardown    Close Browser
Test Template    Checking Sending Message


*** Test Cases ***                        CONTENT
Sending Massage With Valid Data           Robot Framework Test
Sending Empty Message                     ${EMPTY}
