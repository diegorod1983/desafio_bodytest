***Settings***
Documentation       Tudo começa aqui, meu arquivo base do projeto de automação

Library             Browser
Library             Collections
Library             OperatingSystem
Library             DateTime
Library             libs/DeloreanLibrary.py

Resource            actions/auth.robot
Resource            actions/nav.robot
Resource            actions/students.robot
Resource            actions/plans.robot
Resource            actions/enrollments.robot
Resource            actions/components.robot

***Keywords***
Start Browser Section
  New Browser    chromium                     false
  New Page       about:blank

Start Admin Session
    Start Browser Section
    auth.Go to Login Page
    auth.Login With               admin@bodytest.com                  pwd123
    nav.User should be logged in  Administrador

Clear LocalStorage and Take Screenshot
    Take Screenshot
    LocalStorage Clear  

Loading Toaster and Take Screenshot
    [Arguments]     ${time_out}

    sleep           ${time_out}
    Take Screenshot    

### HELPERS
Get JSON from File
    [Arguments]                   ${file_name}    
    
    ${file}                       Get File           ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}                Evaluate           json.loads($file)            json

    # Log to Console                      ${json_object}
    # Log to Console                      ${json_object['students']}
    # Log to Console                      ${json_object['students'][1]}

    [Return]                      ${json_object}    