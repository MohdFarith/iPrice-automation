*** Settings ***

Documentation  This file will only store keywords for COOD.

*** Variables ***

*** Keywords ***

Access COOD Says
    Go To  ${COOD_says_url}
    Sleep  2

Validate COOD Says Main Page
    Title Should Be  ${COOD_says_title}
    Wait Until Element Is Visible  ${COOD_says_navbar_header_logo}
    Element Should Be Visible  ${COOD_says_navbar_header_news}
    Element Should Be Visible  ${COOD_says_navbar_header_fun}
    Element Should Be Visible  ${COOD_says_navbar_header_lifestyle}
    Element Should Be Visible  ${COOD_says_navbar_header_entertainment}
    Element Should Be Visible  ${COOD_says_navbar_header_sport}
    Element Should Be Visible  ${COOD_says_navbar_header_tech}
    Element Should Be Visible  ${COOD_says_navbar_header_imho}
    Element Should Be Visible  ${COOD_says_navbar_header_seismik}
    Element Should Be Visible  ${COOD_says_navbar_header_coupons}
    Mouse Over  ${COOD_says_banner}
    Mouse Over  ${COOD_says_categories_header}
    Mouse Over  ${COOD_says_top_coupons_header}
    Mouse Over  ${COOD_says_recent_coupons_header}
    Mouse Over  ${COOD_says_featured_stores_header}
    Mouse Over  ${COOD_says_content_header}
    Mouse Over  ${COOD_says_footer_logo}

Access COOD Rappler EN
    Go To  ${COOD_rappler_en_url}
    Sleep  2

Validate COOD Rappler EN Main Page
    Title Should Be  ${COOD_rappler_en_title}
    Wait Until Element Is Visible  ${COOD_rappler_en_navbar_header_logo}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_ph}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_id}
    Mouse Over  ${COOD_rappler_en_header}
    Mouse Over  ${COOD_rappler_en_featured_coupons_header}
    Mouse Over  ${COOD_rappler_en_categories_header}
    Mouse Over  ${COOD_rappler_en_popular_coupons_header}
    Mouse Over  ${COOD_rappler_en_latest_coupons_header}
    Mouse Over  ${COOD_rappler_en_content_area}
    Mouse Over  ${COOD_rappler_en_footer_area}

Access COOD Rappler ID
    Go To  ${COOD_rappler_id_url}
    Sleep  2

Validate COOD Rappler ID Main Page
    ${month}  Get Current Date  result_format=%m
    ${IDmonth}  Set Variable If  "${month}"=="01"  Januari
    ...  "${month}"=="02"  Februari
    ...  "${month}"=="03"  Maret
    ...  "${month}"=="04"  April
    ...  "${month}"=="05"  Mei
    ...  "${month}"=="06"  Juni
    ...  "${month}"=="07"  Juli
    ...  "${month}"=="08"  Augustus
    ...  "${month}"=="09"  September
    ...  "${month}"=="10"  Oktober
    ...  "${month}"=="11"  November
    ...  "${month}"=="12"  Desember
    ${year}  Get Current Date  result_format=%Y
    Title Should Be  Promo Kode, Kupon, Diskon Kode, Sale & Voucher di ${IDmonth} ${year} | Rappler Indonesia
    Wait Until Element Is Visible  ${COOD_rappler_id_navbar_header_logo}
    Element Should Be Visible  ${COOD_rappler_id_navbar_header_ph}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_id}
    Mouse Over  ${COOD_rappler_id_header}
    Mouse Over  ${COOD_rappler_id_featured_coupons_header}
    Mouse Over  ${COOD_rappler_id_categories_header}
    Mouse Over  ${COOD_rappler_id_popular_coupons_header}
    Mouse Over  ${COOD_rappler_id_latest_coupons_header}
    Mouse Over  ${COOD_rappler_id_content_area}
    Mouse Over  ${COOD_rappler_id_footer_area}
