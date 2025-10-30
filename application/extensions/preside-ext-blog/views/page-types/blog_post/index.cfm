<cfparam name="args.id"        	   	   field="page.id"        		 	   />
<cfparam name="args.parent_page"       field="page.parent_page"        	   />
<cfparam name="args.title"        	   field="page.title"        		   />
<cfparam name="args.main_content"      field="page.main_content" 		   />
<cfparam name="args.main_image"    	   field="page.main_image" 			   />
<cfparam name="args.publish_date"      field="blog_post.publish_date" 	   />
<cfparam name="args.allow_comments"    field="blog_post.allow_comments"    />
<cfparam name="args.authorName" 	   field="postAuthor.name" 		  	   />
<cfparam name="args.authorDescription" field="postAuthor.description" 	   />
<cfparam name="args.authorPicture" 	   field="postAuthor.picture" 		   />

<cfscript>
	// bannerImageSource = len( args.main_image ) ? event.buildLink( assetId=args.main_image  ) : "";
	// prc.tagsFull
	// tagsRelated
	// blogPosts
    // isShowSideBar
	// dump( prc );
	// dump( args ); abort;
    classContainer = prc.isShowSideBar ? "col-lg-9 col-md-8 col-sm-12 col-xs-12" : "col-md-12";
    
</cfscript>

<cfoutput>
    <div class="page-contain blog-page right-sidebar">
        <div class="container">
            <div class="row">

                <!-- Main content -->
                <div id="main-content" class="main-content #classContainer#">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
							<!---
							<cfif len( bannerImageSource )>
								<div class="thumbnail">
                                	<figure>
										<img src="#bannerImageSource#" width="870" height="635" alt=""></figure>
                            	</div>
							</cfif>
							--->
                          	<h1 class="post-name">#args.title#</h1>
                            <p class="post-archive">
								<b class="post-cat">Ngày xuất bản:</b>
								<span class="post-date">#args.publish_date#</span>
								<span>|</span>
								<b class="post-cat">Tác giả:</b>
								<span class="author"> #args.authorName#</span>
                                <cfif prc.tagsRelated.recordCount NEQ 0>
                                    <span>|</span>
                                    <b class="post-cat">Danh mục:</b>
                                    <cfloop query="prc.tagsRelated">
                                        <cfset tagLink = event.buildLink( page="#args.parent_page#", querystring="filterAction=redirect&filterType=tags&filterValue=" & prc.tagsRelated.id ) />
                                        <a href="#tagLink#" class="tag-link">#prc.tagsRelated.label#</a>,
                                    </cfloop>
                                </cfif>
                        </div>

                        <div class="post-content">
							#args.main_content#
                        </div>

                        <div class="post-foot">
							<!---
                            <div class="post-tags">
                                <span class="tag-title">Tags:</span>
                                <ul class="tags">
                                    <li><a href="##" class="tag-link">Juice Drink</a></li>
                                    <li><a href="##" class="tag-link">Fast Food</a></li>
                                    <li><a href="##" class="tag-link">Fresh Food</a></li>
                                    <li><a href="##" class="tag-link">Hot</a></li>
                                    <li><a href="##" class="tag-link">Backpack</a></li>
                                    <li><a href="##" class="tag-link">Grooming</a></li>
                                </ul>
                            </div>
							--->
                        </div>

                    </div>

                </div>
                <cfif prc.isShowSideBar>
                    <!-- Sidebar -->
                    <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                        <div class="biolife-mobile-panels">
                            <span class="biolife-current-panel-title">Sidebar</span>
                            <a class="biolife-close-btn" href="##" data-object="open-mobile-filter">&times;</a>
                        </div>

                        <div class="sidebar-contain">
                            <!--Categories Widget-->
                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Danh mục dự án</h4>
                                <div class="wgt-content">
                                    <ul class="cat-list">
                                        <cfloop query="prc.tagsFull">
                                            <cfset tagLink = event.buildLink( page="#args.parent_page#", querystring="filterAction=redirect&filterType=tags&filterValue=" & prc.tagsFull.id ) />
                                            <li class="cat-list-item"><a href="#tagLink#" class="cat-link">#prc.tagsFull.label# (#prc.tagsFull.post_count#)</a></li>
                                        </cfloop>
                                    </ul>
                                </div>
                            </div>

                            <!--Posts Widget-->
                            <div class="widget posts-widget">
                                <h4 class="wgt-title">Dự án gần đây</h4>
                                <div class="wgt-content">
                                    <ul class="posts">
                                    <cfloop query="prc.blogPosts">
                                        <cfscript>
                                            picture  = len(prc.blogPosts.main_image) ? event.buildLink( assetId=prc.blogPosts.main_image  ) : "/assets/img/banner_empty.jpg";
                                            link = event.buildLink( page=prc.blogPosts.id );
                                        </cfscript>
                                        <li>
                                            <div class="wgt-post-item">
                                                <div class="thumb">
                                                    <a href="#link#"><img src="#picture#" width="80" height="58" alt=""></a>
                                                </div>
                                                <div class="detail">
                                                    <h4 class="post-name"><a href="#link#">#prc.blogPosts.title#</a></h4>
                                                    <p class="post-archive">#dateFormat(prc.blogPosts.publish_date, "dd-mm-yyyy")#
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </cfloop>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </aside>
                </cfif>
            </div>
        </div>
    </div>
</cfoutput>