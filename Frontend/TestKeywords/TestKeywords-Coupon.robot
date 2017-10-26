*** Settings ***

Documentation  This file will only store keywords for coupon.

*** Variables ***

*** Keywords ***

iPrice Coupon Page Validation  [Arguments]  ${country}
    ${year}  Get Current Date  result_format=%Y
    ${thai_year}  Evaluate  ${year}+543
    Run Keyword If  "${country}"=="MY"  Title Should Be  Get Exclusive Coupons, Discount Codes & Vouchers in ${year} | iPrice Malaysia
    ...  ELSE IF  "${country}"=="VN"  Title Should Be  Exclusive Sales, voucher và khuyến mãi tốt nhất tại vào năm ${year} | iPrice Vietnam
    ...  ELSE IF  "${country}"=="ID"  Title Should Be  Dapatkan Exclusive Promo, Sales & Vouchers\u00a0di tahun ${year} | iPrice Indonesia
    ...  ELSE IF  "${country}"=="SG"  Title Should Be  Get Exclusive Sales, Promotions & Vouchers in ${year} | iPrice Singapore
    ...  ELSE IF  "${country}"=="PH"  Title Should Be  Get Exclusive Sales, Vouchers & Promotions in ${year} | iPrice Philippines
    ...  ELSE IF  "${country}"=="HK"  Title Should Be  Get Exclusive Sales, Coupons & Promotions in ${year} | iPrice Hong Kong
    ...  ELSE IF  "${country}"=="TH"  Title Should Be  แจก ดีล คูปอง รหัสส่วนลด บัตรส่วนลด โปรโมชั่น ของปี พ.ศ. ${thai_year} ที่ iprice ประเทศไทย
