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
	<h1>Coming soon</h1>
</cfoutput>