component {
	property name="dumpLogService" inject="dumpLogService";
	property name="presideObjectService" inject="presideObjectService";
	property name="pageDao" inject="presidecms:object:page";

	
	public void function preHandler( event, action, eventArguments ) {
		// super.preHandler( argumentCollection = arguments );

		// event.cachePage( false );
		prc.page_type = "category_page";
		// event.setLayout( 'product_layout' );
	}

	private function index( event, rc, prc, args={} ) {
		// TODO: create your handler logic here
		prc.pageSize = 9;
		var maxRows         = prc.pageSize;
        var currentPage     = rc.page ?: 1;
		var startRow        = 1;
		if(currentPage > 1){
            startRow = (currentPage - 1) * maxRows;
            if(startRow == maxRows){
                startRow += 1;
            }
		}
		prc.pageTotal =  presideObjectService.selectData(
			objectName = "product"
			, selectFields = [ "count(product.id) as total"]
		).total;

		prc.listCategory =  presideObjectService.selectData(
			objectName = "category"
			, filter       = "category.active = true"
		);

		prc.listProduct = presideObjectService.selectData(
			objectName = "product"
			, propertyName ="category"
			, selectFields = ["product.title as product_title,
							product.id as product_id,
							product.slug as product_slug,
							main_image,
							author,
							teaser,
							product_highline,
							product_new,
							product_discount,
							category.slug as category_slug,
							category.title as category_title,
							product.datecreated"
							]
			, filter       = "product.product_highline = true" 
			, limit        = 5
		);

		prc.product = presideObjectService.selectData(
			objectName = "product"
			, propertyName ="category"
			, selectFields = ["product.title as product_title,
							product.id as product_id,
							product.slug as product_slug,
							main_content,
							main_image,
							product_highline,
							product_new,
							product_discount,
							author,
							teaser,
							category.slug as category_slug,
							category.title as category_title,
							product.datecreated"
						]
			, startRow        = startRow
			, maxRows         = maxRows
		);

		prc.page = currentPage;
		prc.pageSize = maxRows;

		return renderView(
			  view          = 'page-types/category_page/index'
			, presideObject = 'category_page'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

	public string function renderViewList( event, rc, prc, args={} ){
		var pathArray = listToArray(rc.pathString,"/");
		prc.path = pathArray;

		if(pathArray.len() == 1){
			prc.category = presideObjectService.selectData(
				objectName = "category"
				// , selectFields = ["title,slug,top_content,bot_content"]
				, filter       = "category.slug = :categorySlug"
				, filterParams  = { "categorySlug" = {type="string", value=pathArray[1]} }
			);

			prc.listCategory =  presideObjectService.selectData(
				objectName = "category"
				, filter       = "category.active = true"
			);

			prc.listProduct = presideObjectService.selectData(
				objectName = "product"
				, propertyName ="category"
				, selectFields = ["product.title as product_title,
								product.id as product_id,
								product.slug as product_slug,
								main_image,
								author,
								teaser,
								category.slug as category_slug,
								category.title as category_title,
								product.datecreated"
								]
				, filter       = "product.product_highline = true" 
				, limit        = 5
			);
			
			if(prc.category.recordcount()){
				rc.body = renderViewlet( event="page-types.category_page.renderCategory",prc=prc,rc=rc ,prePostExempt=false );
				event.setView( "/core/simpleBodyRenderer" );
				event.setXFrameOptionsHeader();
				return;
			}
		}

		if(pathArray.len() == 2){

			prc.category = presideObjectService.selectData(
				objectName = "category"
				, selectFields = ["category.title,category.slug ,category.id"]
				, filter       = "category.slug = :categorySlug"
				, filterParams  = { "categorySlug" = {type="string", value=pathArray[1]} }
			);

			if(prc.category.recordcount()){
				prc.product = presideObjectService.selectData(
					objectName = "product"
					// , selectFields = ["product.title,
					// 					product.slug,
					// 					product.id,
					// 					product.teaser,
					// 					product.main_content,
					// 					product.main_image,
					// 					product.list_product_image,
					// 					category.id as category_id,
					// 					category.slug as category_slug
					// 				"]
					, filter       = "product.slug = :productSlug"
					, filterParams  = { "productSlug" = {type="string", value=pathArray[2]} }
				);

				if(prc.product.recordcount()){
					prc.listCategory =  presideObjectService.selectData(
						objectName = "category"
						, filter       = "category.active = true"
					);
					prc.listProduct = presideObjectService.selectData(
						objectName = "product"
						, propertyName ="category"
						, selectFields = ["product.title as product_title,
										product.id as product_id,
										product.slug as product_slug,
										main_image,
										author,
										teaser,
										category.slug as category_slug,
										category.title as category_title,
										product.datecreated"
										]
						, filter       = "product.product_highline = true" 
						, limit        = 5
					);

					prc.listRelatedProduct = presideObjectService.selectData(
						objectName = "product"
						, propertyName ="category"
						, selectFields = ["product.title as product_title,
											product.id as product_id,
											product.slug as product_slug,
											main_image,
											author,
											teaser,
											product_highline,
											product_new,
											product_discount,
											category.slug as category_slug,
											category.title as category_title,
											product.datecreated"
										]
						, filter       = "category.slug = :categorySlug"
						, filterParams  = { "categorySlug" = {type="string", value=pathArray[1]} }
						, limit        = 10
					);

					rc.body = renderViewlet( event="page-types.category_page.renderProduct",prc=prc,rc=rc ,prePostExempt=false );
					event.setView( "/core/simpleBodyRenderer" );
					event.setXFrameOptionsHeader();
					return;
				}
			}
		}

		rc.body = renderViewlet( event="errors.notFound",prc=prc,rc=rc ,prePostExempt=false );
		event.setView( "/core/simpleBodyRenderer" );
		event.setXFrameOptionsHeader();
		return;
	}

	private function renderCategory( event, rc, prc, args={} ) {
		// prc.thietke_lv1.getRow(1).slug
		prc.pageSize = 9;
		var maxRows         = prc.pageSize;
        var currentPage     = rc.page ?: 1;
		var startRow        = 1;
		if(currentPage > 1){
            startRow = (currentPage - 1) * maxRows;
            if(startRow == maxRows){
                startRow += 1;
            }
		}
		prc.pageTotal =  presideObjectService.selectData(
			objectName = "product"
			, selectFields = [ "count(product.id) as total"]
			, filter       = "category.slug = :categorySlug"
			, filterParams  = { "categorySlug" = {type="string", value=prc.category.getRow(1).slug} }
		).total;

		prc.product = presideObjectService.selectData(
			objectName = "product"
			, propertyName ="category"
			, selectFields = ["product.title as product_title,
							product.id as product_id,
							product.slug as product_slug,
							main_content,
							main_image,
							author,
							teaser,
							product_highline,
							product_new,
							product_discount,
							category.slug as category_slug,
							category.title as category_title,
							product.datecreated"
						]
			, filter       = "category.slug = :categorySlug"
			, filterParams  = { "categorySlug" = {type="string", value=prc.category.getRow(1).slug} }
			, startRow        = startRow
			, maxRows         = maxRows
		);

		prc.page = currentPage;
		prc.pageSize = maxRows;

		var info = prc.category.getRow(1)
		prc.presidePage.title        			= info.title;
		prc.presidePage.og_locale 				= info.og_locale;
		prc.presidePage.og_type 				= info.og_type;
		prc.presidePage.og_title 				= info.og_title;
		prc.presidePage.og_description 			= info.og_description;
		prc.presidePage.og_url 					= info.og_url;
		prc.presidePage.og_site_name 			= info.og_site_name;
		prc.presidePage.og_image 				= info.og_image;

		return renderView(
			  view          = 'page-types/category_page/category'
			// , presideObject = 'thietke_list'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}

		private function renderProduct( event, rc, prc, args={} ) {
		// TODO: create your handler logic here
		// prc.path
		// prc.gockienthuc_blog_post

		// prc.gockienthuc_blog_post_referent = presideObjectService.selectData(
		// 	objectName = "gockienthuc_blog_post"
		// 	, selectFields = ["gockienthuc_blog_post.title as gockienthuc_title,
		// 					gockienthuc_blog_post.slug as gockienthuc_slug,
		// 					gockienthuc_category.slug as gockienthuc_category_slug,
		// 					gockienthuc_category.title as gockienthuc_category_title,
		// 					main_image,
		// 					teaser"
		// 				]
		// 	, filter       = "gockienthuc_category.slug = :categorySlug"
		// 	, filterParams  = { "categorySlug" = {type="string", value=prc.gockienthuc_blog_post.getRow(1).gockienthuc_category_slug} }
		// 	, maxRows = 4
		// );
		
		var info = prc.product.getRow(1)
		prc.presidePage.title        			= info.title;
		prc.presidePage.og_locale 				= info.og_locale;
		prc.presidePage.og_type 				= info.og_type;
		prc.presidePage.og_title 				= info.og_title;
		prc.presidePage.og_description 			= info.og_description;
		prc.presidePage.og_url 					= info.og_url;
		prc.presidePage.og_site_name 			= info.og_site_name;
		prc.presidePage.og_image 				= info.og_image;

		return renderView(
			  view          = 'page-types/category_page/product'
			// , presideObject = 'thietke_list'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
