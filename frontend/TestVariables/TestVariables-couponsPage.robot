*** Settings ***

Documentation  This file will only store variables for coupon page.

*** Variables ***

${MY_coupon_page_title}  Get Exclusive Coupons, Discount Codes & Vouchers in 2017 | iPrice Malaysia
${VN_coupon_page_title}  Exclusive Sales, voucher và khuyến mãi tốt nhất tại vào năm 2017 | iPrice Vietnam
${ID_coupon_page_title}  Dapatkan Exclusive Promo, Sales & Vouchers\u00a0di tahun 2017 | iPrice Indonesia
${TH_coupon_page_title}  แจก ดีล คูปอง รหัสส่วนลด บัตรส่วนลด โปรโมชั่น ของปี พ.ศ. 2560 ที่ iprice ประเทศไทย
${SG_coupon_page_title}  Get Exclusive Sales, Promotions & Vouchers in 2017 | iPrice Singapore
${HK_coupon_page_title}  Get Exclusive Sales, Coupons & Promotions in 2017 | iPrice Hong Kong
${PH_coupon_page_title}  Get Exclusive Sales, Vouchers & Promotions in 2017 | iPrice Philippines

${MY_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.my/coupons/']
${VN_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.vn/coupons/']
${ID_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.co.id/coupons/']
${SG_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.sg/coupons/']
${PH_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.ph/coupons/']
${HK_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://iprice.hk/coupons/']
${TH_coupons_header_logo_link}  //div[@id='banner']//a[contains(@class,'logo h2') and @href='https://ipricethailand.com/coupons/']

${coupons_banner}  //div[@id="carousel-banners-amp"]

${MY_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.my/']//i[@class='icon icon-breadcrumb']
${VN_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.vn/']//i[@class='icon icon-breadcrumb']
${ID_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.co.id/']//i[@class='icon icon-breadcrumb']
${SG_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.sg/']//i[@class='icon icon-breadcrumb']
${PH_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.ph/']//i[@class='icon icon-breadcrumb']
${HK_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://iprice.hk/']//i[@class='icon icon-breadcrumb']
${TH_coupons_main_breadcrumb_homepage_logo_link}  //div[@id='breadcrumb']//a[@href='https://ipricethailand.com/']//i[@class='icon icon-breadcrumb']
${coupons_main_breadcrumb_coupons_text}  //div[@id='breadcrumb']//span[text()=' Coupons ']

${coupons_main_header_logo}  //div[@id='coupon-header']//div[@class='logo background-logo']

${MY_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Exclusive Sales, Promotions & Coupons in Malaysia 2017']
${VN_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Mã giảm giá, voucher và khuyến mãi mới nhất 2017 tại Việt Nam']
${ID_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Exclusive Promo, Sales & Vouchers\u00a0Terbaru di Indonesia 2017 ']
${SG_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Exclusive Sales, Promotions & Vouchers in Singapore 2017']
${PH_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Exclusive Sales, Vouchers & Promotions in Philippines 2017']
${HK_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='Exclusive Sales, Coupons & Promotions in Hong Kong 2017 ']
${TH_coupons_main_header_h1}  //div[@id='coupon-header']//h1[text()='โปรโมชั่น, ลดราคา และ วอชเชอร์ ที่ดีที่สุดของปี พ.ศ. 2560 ประเทศไทย ']

${MY_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Get the latest promo and discount codes from all online stores']
${VN_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Nhận tất cả Mã Coupon và Ưu đãi nổi bật']
${ID_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Dapatkan kode diskon terbaru dari semua toko online']
${SG_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Get all top coupon codes & offers']
${PH_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Get all top coupon codes & offers']
${HK_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='Get all top coupon codes & offers']
${TH_coupons_main_header_h1_subheading}  //div[@id='coupon-header']//span[text()='รีบเลย! คูปองที่ฮอตที่สุดจากร้านค้าออนไลน์ชั้นนำเรารวบรวมไว้ที่นี่แล้ว!']

${EN_coupons_main_header_popular_online_stores_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='Popular Online Stores']
${VN_coupons_main_header_popular_online_stores_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='Cửa hàng trực tuyến phổ biến']
${ID_coupons_main_header_popular_online_stores_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='Toko Online Populer']
${TH_coupons_main_header_popular_online_stores_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='ร้านค้าออนไลน์ยอดนิยม']

${EN_coupons_main_header_how_to_use_cupon_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='How to use a coupon']
${VN_coupons_main_header_how_to_use_cupon_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='Sử dụng một phiếu giảm giá']
${ID_coupons_main_header_how_to_use_cupon_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='Cara menggunakan kupon']
${TH_coupons_main_header_how_to_use_cupon_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-popular') and text()='วิธีการใช้คูปอง']

${EN_coupons_main_header_exclusive_deals_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-exclusive') and text()='Exclusive Deals']
${VN_coupons_main_header_exclusive_deals_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-exclusive') and text()='Ưu đãi duy nhất']
${ID_coupons_main_header_exclusive_deals_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-exclusive') and text()='Penawaran Eksklusif']
${TH_coupons_main_header_exclusive_deals_link_text}  //div[@id='coupon-header']//div[@class='coupon-link']//a[contains(@href,'#text-exclusive') and text()='ข้อเสนอสุดพิเศษ']

${EN_coupons_top_stores_header}  //div[@class='top-stores']//h2[text()='Top Stores']
${VN_coupons_top_stores_header}  //div[@class='top-stores']//h2[text()='Cửa hàng tiêu biểu']
${ID_coupons_top_stores_header}  //div[@class='top-stores']//h2[text()='Top toko']
${TH_coupons_top_stores_header}  //div[@class='top-stores']//h2[text()='ร้านค้ายอดนิยม']
