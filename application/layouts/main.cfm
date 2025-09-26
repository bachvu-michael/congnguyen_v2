<cfscript>
	body = renderView();
	mainNav = renderViewlet( "core.navigation.mainNavigation" );
	metaTags = renderView( "/general/_pageMetaForHtmlHead" );
	adminBar = renderView( "/general/_adminToolbar" );
    header   = renderView( "/general/_header" );
    footer   = renderView( "/general/_footer" );

	// event.include( "css-bootstrap" )
	// .include( "css-layout" )
	// .include( "js-bootstrap" )
	// .include( "js-jquery" );
	
    event.include( assetId="/css/final-css/");
    event.include( assetId="css-test");

</cfscript>

<cfoutput><!DOCTYPE html>
	<html>
		<head>
			#metaTags#

			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,600;0,700;1,700&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
		
			<link
				href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i"
				rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap"
				rel="stylesheet">
			<link rel="shortcut icon" type="image/x-icon"
				href="/assets/template/images/favicon.png" />

			#event.renderIncludes( "css" )#
			#event.renderIncludes( "js", "top" )#

			<link rel="stylesheet" href="/assets/template/css/bootstrap.min.css">
			<link rel="stylesheet" href="/assets/template/css/animate.min.css">
			<link rel="stylesheet" href="/assets/template/css/font-awesome.min.css">
			<link rel="stylesheet" href="/assets/template/css/nice-select.css">
			<link rel="stylesheet" href="/assets/template/css/slick.min.css">
			<link rel="stylesheet" href="/assets/template/css/style.css">
			<link rel="stylesheet" href="/assets/template/css/main-color03-green.css">


			<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		</head>
		<body class="biolife-body">
			<!-- Preloader -->
			<div id="biof-loading">
				<div class="biof-loading-center">
					<div class="biof-loading-center-absolute">
						<div class="dot dot-one"></div>
						<div class="dot dot-two"></div>
						<div class="dot dot-three"></div>
					</div>
				</div>
			</div>

            #header#

			<div class="container">
				<div class="header">
					<ul class="nav nav-pills pull-right">
						#mainNav#
					</ul>
					<h3 class="text-muted"><a href="/">Preside CMS</a></h3>
				</div>

				#body#

				<div class="footer">
					<p>&copy; Pixl8 2013-#Year( Now() )#</p>
				</div>
			</div>

            #footer#

			<!--Quickview Popup-->
			<div id="biolife-quickview-block" class="biolife-quickview-block">
				<div class="quickview-container">
					<a href="##" class="btn-close-quickview" data-object="open-quickview-block"><span class="biolife-icon icon-close-menu"></span></a>
					<div class="biolife-quickview-inner">
						<div class="media">
							<ul class="biolife-carousel quickview-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".quickview-nav"}'>
								<li><img src="/assets/template/images/details-product/detail_01.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_02.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_03.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_04.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_05.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_06.jpg" alt="" width="500" height="500"></li>
								<li><img src="/assets/template/images/details-product/detail_07.jpg" alt="" width="500" height="500"></li>
							</ul>
							<ul class="biolife-carousel quickview-nav" data-slick='{"arrows":true,"dots":false,"centerMode":false,"focusOnSelect":true,"slidesMargin":10,"slidesToShow":3,"slidesToScroll":1,"asNavFor":".quickview-for"}'>
								<li><img src="/assets/template/images/details-product/thumb_01.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_02.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_03.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_04.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_05.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_06.jpg" alt="" width="88" height="88"></li>
								<li><img src="/assets/template/images/details-product/thumb_07.jpg" alt="" width="88" height="88"></li>
							</ul>
						</div>
						<div class="product-attribute">
							<h4 class="title"><a href="##" class="pr-name">National Fresh Fruit</a></h4>
							<div class="rating">
								<p class="star-rating"><span class="width-80percent"></span></p>
							</div>

							<div class="price price-contain">
								<ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
								<del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
							</div>
							<p class="excerpt">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel maximus lacus. Duis ut mauris eget justo dictum tempus sed vel tellus.</p>
							<div class="from-cart">
								<div class="qty-input">
									<input type="text" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
									<a href="##" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
									<a href="##" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
								</div>
								<div class="buttons">
									<a href="##" class="btn add-to-cart-btn btn-bold">add to cart</a>
								</div>
							</div>

							<div class="product-meta">
								<div class="product-atts">
									<div class="product-atts-item">
										<b class="meta-title">Categories:</b>
										<ul class="meta-list">
											<li><a href="##" class="meta-link">Milk & Cream</a></li>
											<li><a href="##" class="meta-link">Fresh Meat</a></li>
											<li><a href="##" class="meta-link">Fresh Fruit</a></li>
										</ul>
									</div>
									<div class="product-atts-item">
										<b class="meta-title">Tags:</b>
										<ul class="meta-list">
											<li><a href="##" class="meta-link">food theme</a></li>
											<li><a href="##" class="meta-link">organic food</a></li>
											<li><a href="##" class="meta-link">organic theme</a></li>
										</ul>
									</div>
									<div class="product-atts-item">
										<b class="meta-title">Brand:</b>
										<ul class="meta-list">
											<li><a href="##" class="meta-link">Fresh Fruit</a></li>
										</ul>
									</div>
								</div>
								<span class="sku">SKU: N/A</span>
								<div class="biolife-social inline add-title">
									<span class="fr-title">Share:</span>
									<ul class="socials">
										<li><a href="##" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
										<li><a href="##" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="##" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
										<li><a href="##" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
										<li><a href="##" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Scroll Top Button -->
    		<a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

			<script src="/assets/template/js/jquery-3.4.1.min.js"></script>
			<script src="/assets/template/js/bootstrap.min.js"></script>
			<script src="/assets/template/js/jquery.countdown.min.js"></script>
			<script src="/assets/template/js/jquery.nice-select.min.js"></script>
			<script src="/assets/template/js/jquery.nicescroll.min.js"></script>
			<script src="/assets/template/js/slick.min.js"></script>
			<script src="/assets/template/js/biolife.framework.js"></script>
			<script src="/assets/template/js/functions.js"></script>

			#event.renderIncludes( "js" )#
		</body>
	</html>
</cfoutput>