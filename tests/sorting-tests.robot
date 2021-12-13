*** Settings ***
Documentation       Test File for testing Sorting
Resource            resources.robot

*** Test Cases ***
Sort From A to Z
    Login
    Select From List By Value   css=*[data-test="product_sort_container"]       az
    Element Text Should Be      css=#item_4_title_link > .inventory_item_name   Sauce Labs Backpack
    Element Text Should Be      css=#item_0_title_link > .inventory_item_name   Sauce Labs Bike Light
    Element Text Should Be      css=#item_1_title_link > .inventory_item_name   Sauce Labs Bolt T-Shirt
    Element Text Should Be      css=#item_5_title_link > .inventory_item_name   Sauce Labs Fleece Jacket
    Element Text Should Be      css=#item_2_title_link > .inventory_item_name   Sauce Labs Onesie
    Element Text Should Be      css=#item_3_title_link > .inventory_item_name   Test.allTheThings() T-Shirt (Red)
    [Teardown]  Close Browser

Sort From Z to A
    Login
    Select From List By Value   css=*[data-test="product_sort_container"]       za
    Element Text Should Be      css=#item_3_title_link > .inventory_item_name   Test.allTheThings() T-Shirt (Red)
    Element Text Should Be      css=#item_2_title_link > .inventory_item_name   Sauce Labs Onesie
    Element Text Should Be      css=#item_5_title_link > .inventory_item_name   Sauce Labs Fleece Jacket
    Element Text Should Be      css=#item_1_title_link > .inventory_item_name   Sauce Labs Bolt T-Shirt
    Element Text Should Be      css=#item_0_title_link > .inventory_item_name   Sauce Labs Bike Light
    Element Text Should Be      css=#item_4_title_link > .inventory_item_name   Sauce Labs Backpack
    [Teardown]  Close Browser

Sort From Low to High
    Login
    Select From List By Value   css=*[data-test="product_sort_container"]       lohi
    Element Text Should Be      css=.inventory_item:nth-child(1) .inventory_item_price  $7.99
    Element Text Should Be      css=.inventory_item:nth-child(2) .inventory_item_price  $9.99
    Element Text Should Be      css=.inventory_item:nth-child(3) .inventory_item_price  $15.99
    Element Text Should Be      css=.inventory_item:nth-child(4) .inventory_item_price  $15.99
    Element Text Should Be      css=.inventory_item:nth-child(5) .inventory_item_price  $29.99
    Element Text Should Be      css=.inventory_item:nth-child(6) .inventory_item_price  $49.99
    [Teardown]  Close Browser

Sort From High to Low
    Login
    Select From List By Value   css=*[data-test="product_sort_container"]       hilo
    Element Text Should Be      css=.inventory_item:nth-child(1) .inventory_item_price  $49.99
    Element Text Should Be      css=.inventory_item:nth-child(2) .inventory_item_price  $29.99
    Element Text Should Be      css=.inventory_item:nth-child(3) .inventory_item_price  $15.99
    Element Text Should Be      css=.inventory_item:nth-child(4) .inventory_item_price  $15.99
    Element Text Should Be      css=.inventory_item:nth-child(5) .inventory_item_price  $9.99
    Element Text Should Be      css=.inventory_item:nth-child(6) .inventory_item_price  $7.99
    [Teardown]  Close Browser


*** Keywords ***
Login
    Open To Login Page
    Input Username          ${VALID USER}
    Input User Password     ${PASSWORD}
    Attempt Login
    Verify Product Page