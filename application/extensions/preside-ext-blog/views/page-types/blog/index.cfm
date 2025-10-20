<cf_presideparam name="args.title" type="string" field="page.title" />
<cf_presideparam name="args.sidebar_content" type="string"
    field="blog.sidebar_content" />

<cfscript>
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
                            #renderView( view="page-types/blog/_filters", args={
                                tags=prc.tagFilters, authors=prc.authorFilters,
                                archives=prc.archiveFilters,
                                blogId=event.getCurrentPageId() } )#
                        </div>
                    </div>
                    <div class="row">
                       
                        <!--articles block-->
                        <ul class="posts-list main-post-list">
                            <cfloop query="prc.blogPosts">
                                #renderView(
                                    view='page-types/blog/_item',
                                    args={
                                    id=id,
                                    title=title,
                                    publish_date=publish_date,
                                    post_author=postAuthor,
                                    teaser=teaser,
                                    main_image=main_image,
                                    mainImageDerivative="blogMainImageTeaser"
                                    }
                                )#
                            </cfloop>
                        </ul>

                    </div>
                    #renderView( view="page-types/blog/_pagination", 
                        args={ recordCount=prc.presidePage.initial_max_rows, totalRecordCount=prc.totalRecordCount, currentPage=rc.currentPage ?: 1} 
                    )#

                    <!--- Panigation Block
                    <div class="biolife-panigations-block ">
                        <ul class="panigation-contain">
                            <li><span class="current-page">1</span></li>
                            <li><a href="##" class="link-page">2</a></li>
                            <li><a href="##" class="link-page">3</a></li>
                            <li><span class="sep">....</span></li>
                            <li><a href="##" class="link-page">20</a></li>
                            <li><a href="##" class="link-page next"><i
                                        class="fa fa-angle-right"
                                        aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                        --->
                </div>

                <!-- Sidebar -->
                <aside id="sidebar"
                    class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                    <div class="biolife-mobile-panels">
                        <span class="biolife-current-panel-title">Sidebar</span>
                        <a class="biolife-close-btn" href="##"
                            data-object="open-mobile-filter">&times;</a>
                    </div>

                    <div class="sidebar-contain">
                        #args.sidebar_content#
                    </div>
                </aside>
            </div>
        </div>
    </div>
</cfoutput>