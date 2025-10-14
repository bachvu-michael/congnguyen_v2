<cfparam name="args.blog_home" />
<cfparam name="args.blog_list_for_homepage" />
<cfscript>
// dump( args );abort;
</cfscript>
<cfoutput>
    <cfif !isEmpty(args.blog_home)>
        <cfloop array="#args.blog_home#" index="item">
            <cfscript>
                pageTagLink = isEmpty(args.blog_list_for_homepage) ? "/": event.buildLink( page=args.blog_list_for_homepage, querystring="filterAction=redirect&filterType=tags&filterValue=" & item.tag.id )
            </cfscript>
            <div
                class="list-product-homepage blog-posts sm-margin-top-49px xs-margin-top-60px">
                <div class="container">
                    <div
                        class="biolife-title-box biolife-title-box__bold-center xs-margin-bottom-50px sm-margin-bottom-0-im">
                        <h3 class="main-title">#item.tag.label#</h3>
                        <a href="#pageTagLink#">Xem tất cả <i
                                class="fa fa-angle-double-right"
                                aria-hidden="true"></i></a>
                    </div>
                    <ul class="biolife-carousel nav-center nav-none-on-mobile"
                        data-slick='{"rows":2,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 2}},{"breakpoint":768, "settings":{ "slidesToShow": 2}},{"breakpoint":600, "settings":{ "slidesToShow": 1}}]}'>
                        <cfif !isEmpty(item.blogs)>
                            <cfloop array="#item.blogs#" index="blog">
                                <cfscript>
                                    pageLink = event.buildLink( page=blog.id );
	                                picture  = len(blog.main_image) ? event.buildLink( assetId=blog.main_image  ) : "/assets/img/banner_empty.jpg";
                                </cfscript>
                                <li>
                                    <div class="post-item effect-01 style-bottom-info layout-02 ">
                                        <div class="thumbnail">
                                            <a href="#pageLink#" class="link-to-post"><img
                                                    src="#picture#"
                                                    width="270" height="200"
                                                    alt></a>
                                        </div>
                                        <div class="post-content">
                                            <h4 class="post-name"><a href="#pageLink#"
                                                    class="linktopost">#blog.title#</a></h4>
                                        </div>
                                    </div>
                                </li>
                            </cfloop>
                        </cfif>
                    </ul>
                </div>
            </div>
        </cfloop>
    </cfif>

</cfoutput>