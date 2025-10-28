<cfscript>
	locale = 'vi_VN';
	// dump(prc);abort;
	product = prc.product.getRow(1) ?: ""
	// gockienthuc_blog_post_referent = prc.gockienthuc_blog_post_referent
	// dump(prc.gockienthuc_blog_post_referent);abort;
	// event.include( assetId="/js/specific/jquery-dynamic-content-menu/" ,group="bot")

	// event.include( assetId="/js/specific/blog-post-menu/" ,group="bot")
	// js/examples/examples.gallery.js
	site = event.getSite();
	author_link = site.author_link ?: "";
	product = prc.product;
	listCategory = prc.listCategory;
    listProduct = prc.listProduct;
	listRelatedProduct = prc.listRelatedProduct;
	list_product_image = product.list_product_image;
	// dump(list_product_image);abort;
	pageUrl = "";
	if(prc._site.domain == "127.0.0.1"){
		pageUrl = "http://127.0.0.1:50236" & prc._presideUrlPath ;
	}else{
		pageUrl = prc._site.protocol & "://" & prc._site.domain & prc._presideUrlPath;
	}
	disqusShortname = getSystemSetting( "disqus", "short_name", "" );
</cfscript>
<cfoutput>
   <div class="page-contain single-product" style="margin-top:20px;">
        <div class="container">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                
                <!-- summary info -->
                <div class="sumary-product single-layout">
                    <div class="media">
                        <ul class="biolife-carousel slider-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".slider-nav"}'>
                            <cfloop list="#list_product_image#" index="element">
                                <cfset image=event.buildLink( assetId=element ) />
                                <div>
                                    <li><img src="#image#" alt="" width="500" height="500"></li>
                                </div>
                            </cfloop>
                        </ul>
                        <ul class="biolife-carousel slider-nav" data-slick='{"arrows":false,"dots":false,"centerMode":false,"focusOnSelect":true,"slidesMargin":10,"slidesToShow":4,"slidesToScroll":1,"asNavFor":".slider-for"}'>
                            <cfloop list="#list_product_image#" index="element">
                                <cfset image=event.buildLink( assetId=element,derivative= "88x88" ) />
                                <div>
                                    <li><img src="#image#" alt="" width="88" height="88"></li>
                                </div>
                            </cfloop>
                        </ul>
                    </div>
                    <div class="product-attribute">
                        <h3 class="title">#product.title#</h3>
                        <div class="rating">
                            <p class="star-rating"><span class="width-100percent"></span></p>
                            <span class="review-count">(05 Reviews)</span>
                            <b class="category">By: Công Nguyễn</b>
                        </div>
                        <cfset categoryLink = event.buildLink(linkTo = "#product.category_slug#") />
                        <span class="sku">Danh mục: <a href="#categoryLink#">#product.category_title#</a></span>
                        <p class="excerpt">#renderContent( renderer="richeditor", data=product.teaser )#</p>
                        <cfif len(product.price) >
                            <div class="price">
                                <ins>
                                    <span class="price-amount">#LSCurrencyFormat( product.price, "local", "vi_VN" )#</span>
                                </ins>
                            </div>
                            <p>( Giá hiển thị chỉ mang tính chất tham khảo, vui lòng liên hệ với chúng tôi để có được giá tốt nhất )</p>
                        </cfif>
                        <div class="shipping-info">
                            <p class="shipping-day">Liên hệ Công Nguyễn</p>
                            <p class="for-today">0938356395</p>
                        </div>
                    </div>
                    <div class="action-form">
                        <div class="quantity-box">
                            <span class="title">Số Lượng:</span>
                            <div class="qty-input">
                                <input type="text" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
                                <a href="##" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                <a href="##" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            </div>
                        </div>
                        <div class="buttons">
                            <a href="##" class="btn add-to-cart-btn">add to cart</a>
                            <!---
                            <p class="pull-row">
                                <a href="##" class="btn wishlist-btn">wishlist</a>
                                <a href="##" class="btn compare-btn">compare</a>
                            </p>
                            --->
                        </div>
                        <div class="location-shipping-to">
                            <span class="title">Vận chuyển:</span>
                            <select name="shipping_to" class="country">
                                <option value="-1">Chọn thành phố</option>
                                <option value="america">HCM</option>
                                <option value="france">Bình Dương</option>
                                <option value="germany">Đồng Nai</option>
                            </select>
                        </div>
                        <div class="acepted-payment-methods">
                            <ul class="payment-methods">
                                <li><img src="/assets/template/images/card1.jpg" alt="" width="51" height="36"></li>
                                <li><img src="/assets/template/images/card2.jpg" alt="" width="51" height="36"></li>
                                <li><img src="/assets/template/images/card3.jpg" alt="" width="51" height="36"></li>
                                <li><img src="/assets/template/images/card4.jpg" alt="" width="51" height="36"></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Tab info -->
                <div class="product-tabs single-layout biolife-tab-contain">
                    <div class="tab-head">
                        <ul class="tabs">
                            <li class="tab-element active"><a href="##tab_1st" class="tab-link">Thông tin sản phẩm</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="tab_1st" class="tab-contain desc-tab active">
                            #renderContent( renderer="richeditor", data=product.main_content )#
                        </div>
                    </div>
                </div>

                <!-- related products -->
                <div class="product-related-box single-layout">
                    <div class="biolife-title-box lg-margin-bottom-26px-im">
                        <span class="subtitle">Tất cả điều tốt nhất cho bạn</span>
                        <h3 class="main-title">Sản phẩm nổi bật</h3>
                    </div>
                    <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":0,"slidesToShow":5, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}}]}'>
                        <cfloop query="listProduct">
                            <cfset link = event.buildLink( linkto="#category_slug#.#product_slug#" ) />
                            <cfset linkCategory = event.buildLink( linkto="#category_slug#" ) />
                            <cfset img  = len(main_image) ? event.buildLink( assetId=main_image,derivative="270x270"  ) : "/assets/template/images/products/p-13.jpg" />
                            <li class="product-item">
                                <div class="contain-product layout-default">
                                    <div class="product-thumb">
                                        <a href="#link#" class="link-to-product">
                                            <img src="#img#" alt="dd" width="270" height="270" class="product-thumnail">
                                        </a>
                                    </div>
                                    <div class="info">
                                        <b class="categories">#category_title#</b>
                                        <h4 class="product-title"><a href="#link#" class="pr-name">#product_title#</a></h4>
                                        <div class="slide-down-box">
                                            <p class="message">#teaser#</p>
                                            <div class="buttons">
                                                <a href="#link#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>xem thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </cfloop>
                    </ul>
                </div>
                
            </div>
        </div>
    </div>
</cfoutput>