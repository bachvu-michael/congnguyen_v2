<cfscript>
    site                    = event.getSite();
	footer_column_links 	= site.footer_column_links;
</cfscript>
<cfoutput>
    <section class="pre-footer">
        <div class="container content">
            <img src="/assets/img/logo_text.png" alt="logo" class="logo">
            <p>
                Công ty TNHH Quảng cáo & Nội thất Công Nguyễn chuyên
                Thiết kế
                thi công bảng hiệu - Nội thất ngoại thất trọn gói uy tín
                - Gia công cắt
                khắc Lazer - CNC trên mọi chất liệu - In UV - In kỹ
                thuật số khổ lớn.
                Bằng khả năng cung cấp các sản phẩm biển hiệu sáng tạo,
                chuyên
                nghiệp, màu sắc đa dạng và vượt trội so thị trường hiện
                nay.
            </p>
        </div>
    </section>
    <!-- FOOTER -->
    <footer id="footer" class="footer layout-03">
        <div class="footer-content background-footer-03">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                        <section class="footer-item">
                            <h3 class="section-sub-title">Thông tin liên hệ</h3>
                            <h3 class="section-title">CÔNG TY TNHH TM - QUẢNG CÁO & NỘI THẤT CÔNG NGUYỄN</h3>
                            <div
                                class="contact-info-block footer-layout xs-padding-top-10px">
                                <ul class="contact-lines">
                                    <li>
                                        <p class="info-item">
                                            <b class="desc">
                                                MST: 3702931453 cấp ngày 16/11/2020
                                            </b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i
                                                class="biolife-icon icon-location"></i>
                                            <b class="desc">Địa chỉ: 314 KP Bàu Lòng, Xã Trừ Văn Thố, TP Hồ Chí Minh, Việt Nam </b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i
                                                class="biolife-icon icon-phone"></i>
                                            <b class="desc">Hotline: 0938356395</b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i class="biolife-icon icon-letter"></i>
                                            <b class="desc">Email: nguyenthanhcongbh.1982@gmail.com</b>
                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                        <section class="footer-item">
                            <h3 class="section-title">CHÍNH SÁCH VÀ ĐIỀU KHOẢN</h3>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div
                                        class="wrap-custom-menu vertical-menu-2">
                                        <ul class="menu">
                                            <cfif !isEmpty(footer_column_links)>
                                                #renderView(
                                                    view          = "/general/links_view/_footer_column_link"
                                                    , presideObject = "link"
                                                    , filter        = { id=listToArray( footer_column_links ) }
                                                    , orderBy       = "FIELD( id, #listqualify( footer_column_links, "'" )# )"
                                                )#
                                            </cfif>
                                            <!---
                                            <li><a href="##">Chính sách bảo hành</a></li>
                                            <li><a href="##">Chính sách vận chuyển</a></li>
                                            <li><a href="##">Chính sách bảo mật thông tin</a></li>
                                            <li><a href="##">Chính sách đổi trả</a></li>
                                            <li><a href="##">Phương thức thanh toán</a></li>
                                            <li><a href="##">Chính sách kiểm hàng</a></li>
                                            <li><a href="##">Giờ làm việc: T2 -T7 (Từ: 7:00 - 16:30)</a></li>
                                            --->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="separator"></div>
                    </div>
                    <div class="col-xs-12">
                        <div class="copy-right-text">
                            <p>© #Year( Now() )# <b>Bach Vu</b>. All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--Footer For Mobile-->
    <div class="mobile-footer">
        <div class="mobile-footer-inner">
            <div class="mobile-block block-menu-main">
                <a class="menu-bar menu-toggle btn-toggle"
                    data-object="open-mobile-menu" href="javascript:void(0)">
                    <span class="fa fa-bars"></span>
                    <span class="text">Menu</span>
                </a>
            </div>
            <div class="mobile-block block-sidebar">
                <a class="menu-bar filter-toggle btn-toggle"
                    data-object="open-mobile-filter" href="javascript:void(0)">
                    <i class="fa fa-sliders" aria-hidden="true"></i>
                    <span class="text">Sidebar</span>
                </a>
            </div>
            <div class="mobile-block block-minicart">
                <a class="link-to-cart" href="##">
                    <span class="fa fa-shopping-bag" aria-hidden="true"></span>
                    <span class="text">Cart</span>
                </a>
            </div>
            <div class="mobile-block block-global">
                <a class="menu-bar myaccount-toggle btn-toggle"
                    data-object="global-panel-opened" href="javascript:void(0)">
                    <span class="fa fa-globe"></span>
                    <span class="text">Global</span>
                </a>
            </div>
        </div>
    </div>

    <div class="mobile-block-global">
        <div class="biolife-mobile-panels">
            <span class="biolife-current-panel-title">Global</span>
            <a class="biolife-close-btn" data-object="global-panel-opened"
                href="##">&times;</a>
        </div>
        <div class="block-global-contain">
            <div class="glb-item my-account">
                <b class="title">My Account</b>
                <ul class="list">
                    <li class="list-item"><a href="##">Login/register</a></li>
                    <li class="list-item"><a href="##">Wishlist <span
                                class="index">(8)</span></a></li>
                    <li class="list-item"><a href="##">Checkout</a></li>
                </ul>
            </div>
            <div class="glb-item currency">
                <b class="title">Currency</b>
                <ul class="list">
                    <li class="list-item"><a href="##">€ EUR (Euro)</a></li>
                    <li class="list-item"><a href="##">$ USD (Dollar)</a></li>
                    <li class="list-item"><a href="##">£ GBP (Pound)</a></li>
                    <li class="list-item"><a href="##">¥ JPY (Yen)</a></li>
                </ul>
            </div>
            <div class="glb-item languages">
                <b class="title">Language</b>
                <ul class="list inline">
                    <li class="list-item"><a href="##"><img
                                src="/assets/template/images/languages/us.jpg"
                                alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="##"><img
                                src="/assets/template/images/languages/fr.jpg"
                                alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="##"><img
                                src="/assets/template/images/languages/ger.jpg"
                                alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="##"><img
                                src="/assets/template/images/languages/jap.jpg"
                                alt="flag" width="24" height="18"></a></li>
                </ul>
            </div>
        </div>
    </div>
</cfoutput>
