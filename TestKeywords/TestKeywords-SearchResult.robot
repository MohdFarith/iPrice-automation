*** Settings ***

Documentation  This file will only store keywords for search result.

*** Variables ***

*** Keywords ***

iPrice Product Search Result Page Validation  [Arguments]  ${country}  ${searchValue}
    Run Keyword If  "${country}"=="MY"  Title Should Be  ${searchValue} - Buy ${searchValue} online in Malaysia | iPrice
    ...  ELSE IF  "${country}"=="VN"  Title Should Be  Tìm kiếm | iprice Việt Nam
    ...  ELSE IF  "${country}"=="ID"  Title Should Be  Toko | iprice Indonesia
    ...  ELSE IF  "${country}"=="SG"  Title Should Be  Search | iprice Singapore
    ...  ELSE IF  "${country}"=="PH"  Title Should Be  ${searchValue} - Buy ${searchValue} online in Philippines | iPrice
    ...  ELSE IF  "${country}"=="HK"  Title Should Be  Search | iprice Hong Kong
    ...  ELSE IF  "${country}"=="TH"  Title Should Be  ค้นหา | iprice ประเทศไทย
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${searchValue}']

iPrice Search Result Listing Validation  [Arguments]  ${country}  ${searchValue}
    ${count}  Get Matching Xpath Count  //section[@class='product-list']/a
    :FOR  ${INDEX}  IN RANGE  1  ${count}+1
    \  Mouse Over  //section[@class='product-list']/a[${INDEX}]
    \  Wait Until Element Is Visible  //section[@class='product-list']/a[${INDEX}]//div[@class='placeholder']//img[contains(@data-original,'.jpg')]

iPrice Brand Search Result Page Validation  [Arguments]  ${country}  ${searchValue}
    Run Keyword If  "${country}"=="MY"  Title Should Be  ${searchValue} Online Store | The best prices online in Malaysia | iPrice
    ...  ELSE IF  "${country}"=="VN"  Title Should Be  Cửa hàng trực tuyến ${searchValue} | các ưu đãi giá trực tuyến tốt nhất tại Việt Nam | iPrice
    ...  ELSE IF  "${country}"=="ID"  Title Should Be  Online Store ${searchValue}|harga online terbaik di Indonesia | iPrice
    ...  ELSE IF  "${country}"=="SG"  Title Should Be  ${searchValue} Online Store | The best prices online in Singapore | iPrice
    ...  ELSE IF  "${country}"=="PH"  Title Should Be  ${searchValue} Online Store | The best prices online in Philippines | iPrice
    ...  ELSE IF  "${country}"=="HK"  Title Should Be  ${searchValue} Online Store | The best prices online in Hong Kong | iPrice
    ...  ELSE IF  "${country}"=="TH"  Title Should Be  ผลิตภัณฑ์${searchValue}ออนไลน์|ราคาออนไลน์ที่ถูกที่สุดในไทย | iPrice
    Run Keyword If  "${country}"=="MY"  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${searchValue} Online Store']
    ...  ELSE IF  "${country}"=="VN"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='Cửa hàng trực tuyến ${searchValue}']
    ...  ELSE IF  "${country}"=="ID"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='Online Store ${searchValue}']
    ...  ELSE IF  "${country}"=="SG"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${searchValue} Online Store']
    ...  ELSE IF  "${country}"=="PH"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${searchValue} Online Store']
    ...  ELSE IF  "${country}"=="HK"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${searchValue} Online Store']
    ...  ELSE IF  "${country}"=="TH"  Title Should Be  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='ร้านค้า${searchValue}ออนไลน์']
