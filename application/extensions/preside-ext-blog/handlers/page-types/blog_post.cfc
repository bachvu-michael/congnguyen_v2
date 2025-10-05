component {

    property name="blogPostDao" inject="presidecms:object:blog_post";
    property name="blogDao" inject="presidecms:object:blog";
    property name="pageDao" inject="presidecms:object:page";
    property name="blogService" inject="blogService";

    private function index( event, rc, prc, args={} ) {

        prc.tagsRelated = blogPostDao.selectManyToManyData(
              propertyName = "tags"
            , selectFields = [ "distinct tags.id", "tags.label" ]
            , id           = event.getCurrentPageId()
            , orderBy      = "tags.label"
        );

		prc.tagsFull = blogService.getBlogPostTags( featuredOnly=true );
        
        prc.blogPosts = blogService.getFilteredBlogPosts(
              parentPage=prc.presidePage.parent_page ?: "invalidId"
            , topPostsOnly=true
            , mostViewed=false
            , maxRows=8
        );

        var parentPage = pageDao.selectData(
              id = prc.presidePage.parent_page ?: "invalidId"
        );

        prc.isShowSideBar = parentPage.layout == "index";

        // cache busting
        prc.blogPosts = duplicate( prc.blogPosts );

        prc.includeDisqus  = prc.presidePage.allow_comments ?: false;
        prc.includeAddThis = true;

        return renderView(
              view          = 'page-types/blog_post/index'
            , presideObject = 'blog_post'
            , id            = event.getCurrentPageId()
            , args          = args
        );
    }
}
