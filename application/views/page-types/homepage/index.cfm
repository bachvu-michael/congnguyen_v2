<cfparam name="args.title" type="string" field="page.title" />
<cfparam name="args.main_content" type="string" field="page.main_content" />
<cfparam name="args.product_hight_light" type="string" field="homepage.product_hight_light" />
<cfparam name="args.blog_tag" type="string" field="homepage.blog_tag" />
<cfparam name="args.blog_list_for_homepage" type="string" field="homepage.blog_list_for_homepage" />
<cfparam name="args.product_list_link" type="string" field="homepage.product_list_link" />
<cfscript>
	// dump(args.product_list_link);abort;
</cfscript>
<cfoutput>
    <section class="hero-area container hidden-xs">
        <img src="/assets/img/home-hero.jpg" alt="hero home">
    </section>

	#renderViewlet( event="page-types.homepage.render_tag", args={ blog_tag=args.blog_tag, blog_list_for_homepage = args.blog_list_for_homepage })#

	<div class="list-product-homepage blog-posts sm-margin-top-49px xs-margin-top-60px">
		<div class="container">
			<div class="biolife-title-box biolife-title-box__bold-center xs-margin-bottom-50px sm-margin-bottom-0-im">
				<h3 class="main-title">Sản phẩm tiêu biểu</h3>
				#renderLink( 
					id=args.product_list_link,
					body="Xem tất cả <i class='fa fa-angle-double-right' aria-hidden='true'></i>",
					class="link-hover-style-1"
				)#
			</div>
			<ul class="biolife-carousel nav-center nav-none-on-mobile"
				data-slick='{"rows":2,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 2}},{"breakpoint":768, "settings":{ "slidesToShow": 2}},{"breakpoint":600, "settings":{ "slidesToShow": 1}}]}'>
				#renderViewlet( event="page-types.homepage.render_products", args={ product_hight_light=args.product_hight_light })#
			</ul>
		</div>
	</div>
	<section class="history-area">
		<h2>QUÁ TRÌNH PHÁT TRIỂN QUẢNG CÁO CÔNG NGUYỄN</h2>
		<div class="container">
			<img src="/assets/img/history-banner.jpg" alt="cong nguyen history" loading="lazy">
		</div>
	</section>
	
	<section class="target-area container">
		<h2>TẦM NHÌN VÀ SỨ MỆNH</h2>
		<div class="list-card">
			<div class="card">
				<div class="card-body">
					<img src="/assets/img/icon1.png" alt="icon" class="card-icon">
					<h3 class="card-title">Khách hàng là trung tâm</h3>
					<p class="card-text">Chúng tôi quan tâm đến khách hàng, đặt lợi ích khách hàng lên hàng đầu, coi niềm vui của khách hàng trên hết.</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<img src="/assets/img/icon2.png" alt="icon" class="card-icon">
					<h3 class="card-title">Sáng tạo</h3>
					<p class="card-text">Chúng tôi tạo ra các ý tưởng mới, độc đáo và gây ấn tượng, giúp khách hàng nổi bật và thu hút sự chú ý về thương hiệu của họ.</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<img src="/assets/img/icon3.png" alt="icon" class="card-icon">
					<h3 class="card-title">Hiệu quả</h3>
					<p class="card-text">Chúng tôi nhanh chóng xác định nhu cầu của khách hàng từ đó nhanh nhất có được sản phẩm tối ưu nhất.</p>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<img src="/assets/img/icon4.png" alt="icon" class="card-icon">
					<h3 class="card-title">Đổi mới và tiến bộ</h3>
					<p class="card-text">Chúng tôi luôn luôn có những sản phẩm bắt kịp xu thế hiện tại, từ đó không để những điều đem đến cho khách hàng là lỗi thời.</p>
				</div>
			</div>

		</div>
	</section>
</cfoutput>