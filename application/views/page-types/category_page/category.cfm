<cfscript>
    locale = 'vi_VN';
    // prc.maunha_blog_post_list
    // prc.thietke_lv1

    // maunha_blog_post_list = prc.maunha_blog_post_list ?: ""
    category = prc.category.getRow(1) ?: ""
    // thietke_lv2_list = prc.thietke_lv2_list ?: ""

    // dump(prc);abort;
    // prc.product
    // prc.presidePage.title = thietke_lv1.title
    listCategory = prc.listCategory;
    listProduct = prc.listProduct;
    product = prc.product;
</cfscript>
<cfoutput>
    <!-- Page Contain -->
    <div class="page-contain blog-page right-sidebar">
        <div class="container">
            <div class="row">
                <!-- Main content -->
                <div id="main-content"
                    class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="posts-list main-post-list">
                                <cfloop query="product">
                                    #renderView(
                                    view='page-types/category_page/_item',
                                    args={
                                        id=product_id,
                                        title=product_title,
                                        slug=product_slug,
                                        teaser=teaser,
                                        main_image=main_image,
                                        category_slug=category_slug,
                                        category_title = category_title,
                                        datecreated = datecreated,
                                        product_highline = product_highline,
                                        product_new = product_new,
                                        product_discount = product_discount
                                    }
                                )#
                                </cfloop>
                            </ul>
                        </div>
                    </div>
                    <div class="row">

                        <!--articles block-->
                        <ul class="posts-list main-post-list">

                        </ul>

                    </div>

                    <cfif !isEmpty( product )>
                        <cfscript>
                            numberPage = prc.pageTotal / prc.pageSize;
                            nextPage = prc.page+1
                            revPage = prc.page-1
                        </cfscript>

                        <div class="biolife-panigations-block ">
                             <ul class="panigation-contain">
                                <cfif prc.page neq 1>
                                    <cfset link = event.buildLink( linkto="#category.slug#", querystring="page="&revPage  ) />
                                    <li ><a class="link-page" href="#link#"><i class="fa fa-angle-left"></i></a></li>
                                </cfif>
                                <cfloop index="indx" from="1" to="#Ceiling(numberPage)#">
                                    <cfif indx eq prc.page>
                                        <cfset link = event.buildLink( linkto="#category.slug#", querystring="page="&indx  ) />
                                        <li><span class="current-page">#indx#</span></li>
                                    <cfelse>
                                        <cfset link = event.buildLink( linkto="#category.slug#", querystring="page="&indx  ) />
                                        <li ><a class="link-page" href="#link#">#indx#</a></li>
                                    </cfif>
                                </cfloop>
                                <cfif prc.page neq Ceiling(numberPage)>
                                    <cfset link = event.buildLink( linkto="#category.slug#", querystring="page="&nextPage  ) />
                                    <li ><a class="link-page" href="#link#"><i class="fa fa-angle-right"></i></a></li>
                                </cfif>
                            </ul>
                        </div>

                        </cfif>

                    </div>

                    <!-- Sidebar -->
                    <aside id="sidebar"
                        class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                        <div class="biolife-mobile-panels">
                            <span
                                class="biolife-current-panel-title">Sidebar</span>
                            <a class="biolife-close-btn" href="##"
                                data-object="open-mobile-filter">&times;</a>
                        </div>

                        <div class="sidebar-contain">
                            <!---
                        <form action="#event.buildLink( page="search_results" )#" method="GET">
                            <div class="input-group mb-3 pb-1">
                                <input class="form-control text-1" placeholder="Search..." name="q" id="q" type="text">
                                <button type="submit" class="btn btn-dark text-1 p-2"><i
                                        class="fas fa-search m-2"></i></button>
                            </div>
                        </form>
                        --->
                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Danh mục sản phẩm</h4>
                                <div class="wgt-content">
                                    <ul class="cat-list">
                                        <cfloop query="listCategory">
                                            <cfset link=event.buildLink(
                                                linkto="#slug#" ) />
                                            <li class="cat-list-item"><a
                                                    class="cat-link"
                                                    href="#link#">#title#</a></li>
                                        </cfloop>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget posts-widget widget widget-list">
                                <h4 class="wgt-title">Dự án gần đây</h4>
                                <div class="wgt-content">
                                    <ul class="posts">
                                        <cfloop query="listProduct">
                                        <cfset link=event.buildLink(linkto="#category_slug#.#product_slug#") />
                                        <cfset linkCategory=event.buildLink(
                                            linkto="#category_slug#" ) />
                                        <cfset img=len(main_image) ?
                                            event.buildLink( assetId=main_image
                                            ) :
                                            "/assets/img/banner_empty.jpg" />
                                            <li>
                                            <div class="wgt-post-item">
                                                <div class="thumb">
                                                    <a
                                                        href="#link#"><img
                                                            src="#img#"
                                                            width="80"
                                                            height="58" alt></a>
                                                </div>
                                                <div class="detail">
                                                    <h4 class="post-name"><a
                                                            href="#link#">#product_title#</a></h4>
                                                    <p
                                                        class="post-archive">#dateFormat(datecreated,"mm/dd/yyyy")#</p>
                                                </div>
                                            </div>
                                        </li>
                                    </cfloop>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
</cfoutput>