*** settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variables ***
${URL}                              https://abhigyank.github.io/To-Do-List/
${BROWSER}                          Chrome
${input_todo}                       //*[@id="new-task"]
${todo}                             Task1
${todo2}                            Task2
${btn_add}                          //*[@id="add-item"]/button
${btn_delete_incomplete}            //*[@id="incomplete-tasks"]/li/button/span
${btn_delete_complete}              //*[@id="completed-tasks"]/li/button/span
${task_menu}                        //a[contains(@href,'#todo')]
${add_menu}                         //a[contains(@href,'#add-item')]
${completed_menu}                   //a[contains(@href,'#completed')]
${check_box}                        //*[@id="incomplete-tasks"]/li[2]/label/span[4]

*** Keywords ***
Verify Add Todo List Success when clicking on "+" button     
    Input Text                  ${input_todo}       ${todo}
    Sleep                       2s
    Click Element               ${btn_add}
    Sleep                       2s
    Input Text                  ${input_todo}       ${todo2}
    Sleep                       2s
    Click Element               ${btn_add}
    Sleep                       3s

Verify the system will not add task when not clicking on "+" button
    Click Element               ${add_menu} 
    Input Text                  ${input_todo}       ${todo2}
    Sleep                       3s

*** Test cases ***
TC_001 Add Todo List Success
    Open Browser                about:blank    chrome
    Go To                       ${URL}
    Verify Add Todo List Success when clicking on "+" button
    Sleep                       3s

TC_002 Display Todo Tasks
    Click Element               ${task_menu}
    Sleep                       2s

TC_003 Complete Tasks and Display completed tasks
    Verify the system will not add task when not clicking on "+" button
    Click Element               ${btn_add}
    Click Element               ${task_menu}
    Sleep                       2s
    Click Element               ${check_box}
    Sleep                       2s       
    Click Element               ${completed_menu}
    Sleep                       2s        

TC_004 Delete Task
    Click Element               ${add_menu}
    Verify Add Todo List Success when clicking on "+" button
    Click Element               ${task_menu}
    Sleep                       2s
    Click Element               ${btn_delete_incomplete}
    Sleep                       2s

TC_005 Delete completed task
    Click Element               ${completed_menu}
    Sleep                       2s
    Click Element               ${btn_delete_complete}
    Sleep                       2s

TC_006 Do not Add task
    Verify the system will not add task when not clicking on "+" button
                  