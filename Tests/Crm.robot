*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary
*** Variables ***


*** Test Cases ***
should be able to add new customer
        [Documentation]          This is some basic info about the test
        [Tags]                   1006  Smoke   Contacts
        #Initialize Selenium
        set selenium speed       .2s
        set selenium timeout      5s


        #open the browser
        log                      Starting the test case!
        open browser             https://automationplayground.com/crm/        chrome

        # resize browser window for recording
#        set window position    x=341    y=169
        set window size        width=1935    height=590

        page should contain    Customers Are Priority One

        click link             id=SignIn
        page should contain    Login

        input text    id=email-id       movankhalil@robotfw.com
        input text    id=password       Hahahaha
        click button  id=submit-id
        page should contain    Our Happy Customers

        click link    id=new-customer
        page should contain    Add Customer

        input text    id=EmailAddress       jackdoe@gmail.com
        input text    id=FirstName          Jack
        input text    id=LastName           Doe
        input text    id=City               Dallas
        select from list by value    id=StateOrRegion       TX
        select radio button         gender          male
        select checkbox    name=promos-name
        click button    Submit
        wait until page contains    Success! New customer added.

        sleep                    3s
        close browser

*** Keywords ***

