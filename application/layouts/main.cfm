<cfscript>
	body = renderView();
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
	<html lang="vi">
		<head>
			#metaTags#

			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta charset="UTF-8">
			
			<!-- Favicon for most browsers -->
			<link rel="shortcut icon" href="/assets/img/favicon/favicon.ico" type="image/x-icon">

			<!-- Apple Touch Icon for iOS devices -->
			<link rel="apple-touch-icon" href="/assets/img/favicon/apple-touch-icon.png">

			<!-- Android Chrome Icon for Chrome on Android -->
			<link rel="icon" sizes="192x192" href="/assets/img/favicon/android-chrome-192x192.png">

			<!-- Android Chrome Icon for Android home screen in older versions -->
			<link rel="icon" sizes="512x512" href="/assets/img/favicon/android-chrome-512x512.png">

			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wdth,wght@0,75..100,100..900;1,75..100,100..900&display=swap" rel="stylesheet">

			<link
				href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i"
				rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap"
				rel="stylesheet">

			<link rel="stylesheet" href="/assets/template/css/bootstrap.min.css">
			<link rel="stylesheet" href="/assets/template/css/animate.min.css">
			<link rel="stylesheet" href="/assets/template/css/font-awesome.min.css">
			<link rel="stylesheet" href="/assets/template/css/nice-select.css">
			<link rel="stylesheet" href="/assets/template/css/slick.min.css">
			<link rel="stylesheet" href="/assets/template/css/style.css">
			<link rel="stylesheet" href="/assets/template/css/main-color03-green.css">
			
			#event.renderIncludes( "css" )#
			#event.renderIncludes( "js", "top" )#

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

			<div class="container-fluid">

				#body#

			</div>

            #footer#

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

			#event.renderIncludes( "js" ,"bottom")#
		</body>
	</html>
</cfoutput>