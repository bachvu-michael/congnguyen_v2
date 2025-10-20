<cf_presideparam name="args.title" type="string" field="page.title" />
<cf_presideparam name="args.sidebar_content" type="string"
    field="blog.sidebar_content" />

<cfscript>
</cfscript>
<cfoutput>
    <!-- Page Contain -->
    <div class="page-contain blog-page">
        <div class="container">
            <!-- Main content -->
            <div id="main-content" class="main-content">
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
                    <ul class="posts-list main-post-list posts-list-third-layout">
                        <cfloop query="prc.blogPosts">
                            #renderView(
                                view='page-types/blog/_item_third_layout',
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

            </div>
        </div>
    </div>
</cfoutput>