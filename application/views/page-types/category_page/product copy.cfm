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
	<div role="main" class="main shop py-4">

		<div class="container">

			<div class="row">
				<div class="col-lg-9">

					<div class="row">
						<div class="col-lg-6">

							<div class="thumb-gallery-wrapper">
								<div
									class="thumb-gallery-detail owl-carousel owl-theme manual nav-inside nav-style-1 nav-dark mb-3">
									<cfloop list="#list_product_image#" index="element">
										<cfset image=event.buildLink( assetId=element ) />
										<div>
											<img alt="" class="img-fluid" src="#image#" data-zoom-image="#image#">
										</div>
									</cfloop>
								</div>
								<div class="thumb-gallery-thumbs owl-carousel owl-theme manual thumb-gallery-thumbs">
									<cfloop list="#list_product_image#" index="element">
										<cfset image=event.buildLink( assetId=element ) />
										<img alt="" class="img-fluid" src="#image#">

									</cfloop>
								</div>
							</div>

						</div>

						<div class="col-lg-6">

							<div class="summary entry-summary position-relative">

								<div class="position-absolute top-0 right-0">
									<div class="products-navigation d-flex">
										<a href="##"
											class="prev text-decoration-none text-color-dark text-color-hover-primary border-color-hover-primary"
											data-bs-toggle="tooltip" data-bs-animation="false"
											data-bs-original-title="Red Ladies Handbag"><i
												class="fas fa-chevron-left"></i></a>
										<a href="##"
											class="next text-decoration-none text-color-dark text-color-hover-primary border-color-hover-primary"
											data-bs-toggle="tooltip" data-bs-animation="false"
											data-bs-original-title="Green Ladies Handbag"><i
												class="fas fa-chevron-right"></i></a>
									</div>
								</div>

								<h1 class="mb-0 font-weight-bold text-7">#product.title#</h1>

								<div class="divider divider-small">
									<hr class="bg-color-grey-scale-4">
								</div>

								<p class="text-3-5 mb-3">
    									#renderContent( renderer="richeditor", data=product.main_content )#
								</p>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col">
							<div id="description"
								class="tabs tabs-simple tabs-simple-full-width-line tabs-product tabs-dark mb-2">
								<ul class="nav nav-tabs justify-content-start">
									<li class="nav-item"><a
											class="nav-link active font-weight-bold text-3 text-uppercase py-2 px-3"
											href="##productDescription" data-bs-toggle="tab">Nhận xét</a></li>
									<li class="nav-item"><a
											class="nav-link font-weight-bold text-3 text-uppercase py-2 px-3"
											href="##productInfo" data-bs-toggle="tab">Thông tin thêm</a></li>
								</ul>
								<div class="tab-content p-0">
									<div class="tab-pane px-0 py-3 active" id="productDescription">
											<div class="disqus-thread-wrapper"><div id="disqus_thread"></div></div>
									</div>
									<div class="tab-pane px-0 py-3" id="productInfo">
    									#renderContent( renderer="richeditor", data=product.teaser )#
									</div>
								</div>
							</div>
						</div>
					</div>

					<hr class="solid my-5">

					<h4 class="mb-3">Sản phẩm liên quan</h4>
					<div class="products row">
						<div class="col">
							<div class="owl-carousel owl-theme show-nav-title nav-dark mb-0"
								data-plugin-options="{'loop': false, 'autoplay': false,'items': 4, 'nav': true, 'dots': false, 'margin': 20, 'autoplayHoverPause': true, 'autoHeight': true}">
								<cfscript>
									// dump(prc.listRelatedProduct);abort;
								</cfscript>
								<cfloop query="listRelatedProduct">
									<cfscript>
										pageLink = event.buildLink( linkto='#category_slug#.#product_slug#' );
										pageCategoryLink = event.buildLink( linkto='#category_slug#' );
										img = len(main_image) ? event.buildLink( assetId=main_image ) : "/assets/template/img/products/product-grey-7.jpg";
									</cfscript>
									<div class="product mb-0">
										<div class="product-thumb-info border-0 mb-3">

											<div class="product-thumb-info-badges-wrapper">
												<cfif product_new EQ true>
													<span class="badge badge-ecommerce badge-success">Mới</span>
												</cfif>
												<cfif product_discount EQ true>
													<span class="badge badge-ecommerce badge-danger">Giảm giá</span>
												</cfif>
											</div>

											<a href="#pageLink#"
												class="quick-view text-uppercase font-weight-semibold text-2">
												Chi tiết
											</a>
											<a href="#pageLink#">
												<div class="product-thumb-info-image ">
													<img alt="product image" class="img-fluid" src="#img#">
												</div>
											</a>
										</div>
										<div class="d-flex justify-content-between">
											<div>
												<a href="#pageCategoryLink#"
													class="d-block text-uppercase text-decoration-none text-color-default text-color-hover-primary line-height-1 text-0 mb-1">#category_title#</a>
												<h3
													class="text-3-5 font-weight-medium font-alternative text-transform-none line-height-3 mb-0">
													<a href="#pageLink#"
														class="text-color-dark text-color-hover-primary">#product_title#</a>
												</h3>
											</div>
											<a href="##"
												class="text-decoration-none text-color-default text-color-hover-dark text-4"><i
													class="far fa-heart"></i></a>
										</div>
										<div title="Rated 5 out of 5">
											<input type="text" class="d-none" value="5" title="" data-plugin-star-rating
												data-plugin-options="{'displayOnly': true, 'color': 'default', 'size':'xs'}">
										</div>
										<p class="price text-1 mb-3">
											<span class="sale text-color-dark font-weight-semi-bold">#dateFormat(datecreated, "mm/dd/yyyy")#</span>
										</p>
									</div>
								</cfloop>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-3">
					<aside class="sidebar">
						<form action="#event.buildLink( page="search_results" )#" method="GET">
                            <div class="input-group mb-3 pb-1">
                                <input class="form-control text-1" placeholder="Search..." name="q" id="q" type="text">
                                <button type="submit" class="btn btn-dark text-1 p-2"><i
                                        class="fas fa-search m-2"></i></button>
                            </div>
                        </form>
						<h5 class="font-weight-semi-bold pt-3">Danh mục</h5>
						<ul class="nav nav-list flex-column">
							<cfloop query="listCategory">
                                <cfset link = event.buildLink( linkto="#slug#" ) />
                                <li class="nav-item"><a class="nav-link" href="#link#">#title#</a></li>
                            </cfloop>
						</ul>
						<div class="row mb-5">
							<div class="col">
								<h5 class="font-weight-semi-bold pt-5">Sản phẩm nổi bật</h5>
								<cfloop query="listProduct">
                                    <cfset link = event.buildLink( linkto="#category_slug#.#product_slug#" ) />
                                    <cfset linkCategory = event.buildLink( linkto="#category_slug#" ) />
                                    <cfset img  = len(main_image) ? event.buildLink( assetId=main_image  ) : "/assets/template/img/products/product-grey-6.jpg" />
                                    <div class="product row row-gutter-sm align-items-center mb-4">
                                        <div class="col-5 col-lg-5">
                                            <div class="product-thumb-info border-0">
                                                <a href="#link#">
                                                    <div class="product-thumb-info-image">
                                                        <img alt="#product_title#" class="img-fluid" src="#img#">
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-7 col-lg-7 ms-md-0 ms-lg-0 ps-lg-1 pt-1">
                                            <a href="#linkCategory#"
                                                class="d-block text-uppercase text-decoration-none text-color-default text-color-hover-primary line-height-1 text-0 mb-2">#category_title#</a>
                                            <h3
                                                class="text-3-5 font-weight-medium font-alternative text-transform-none line-height-3 mb-0">
                                                <a href="#link#" class="text-color-dark text-color-hover-primary text-decoration-none">#product_title#</a></h3>
                                            <div title="Rated 5 out of 5">
                                                <input type="text" class="d-none" value="5" title="" data-plugin-star-rating
                                                    data-plugin-options="{'displayOnly': true, 'color': 'dark', 'size':'xs'}">
                                            </div>
                                            <p class="price text-2 mb-0">
                                                <span class="amount">#dateFormat(datecreated, "mm/dd/yyyy")#</span>
                                            </p>
                                        </div>
                                    </div>
                                </cfloop>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>

	</div>

	<script id="dsq-count-scr" src="//congnguyen-vn.disqus.com/count.js" async></script>

	<script>
		var disqus_config = function () {
			this.page.url = '#pageUrl#';
			this.page.identifier = '#pageUrl#';
			this.page.title			= 'Which HTTP Status Code to Use for Every CRUD App';
		};
		(function() {
		var d = document, s = d.createElement('script');

		s.src = '//#disqusShortname#.disqus.com/embed.js';

		s.setAttribute('data-timestamp', +new Date());
		(d.head || d.body).appendChild(s);
		})();
	</script>
	<script id="dsq-count-scr" src="//#disqusShortname#.disqus.com/count.js" async></script>
	<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>

</cfoutput>