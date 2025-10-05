component {

    property name="blogService" inject="blogService";
    property name="blogFilters" inject="blogFilters";
    property name="siteTreeService" inject="siteTreeService";
    property name="feedGenerator"   inject="feedGenerator@cbfeeds";
    property name="blogPostDao" inject="presidecms:object:blog_post";
    property name="pageDao" inject="presidecms:object:page";
    property name="blogDao" inject="presidecms:object:blog";
    property name="blogTagDao" inject="presidecms:object:blog_tag";

    private function render_tag( event, rc, prc, args={} ) {
        var tagIds = listToArray( args.blog_tag );
        args.blog_home = [];
        for( var tagId in tagIds ) {
            // var blogPostTags = blogService.getBlogPostTags( tags=[tagId] );
            var blogPostTags = blogService.getFilteredBlogPosts( tags=[tagId], maxRows=8, startRow=1 );

            var tag = blogTagDao.selectData(
		        id = tagId
                , selectFields = [ "id", "label", "featured" ]
                , orderBy      = "label"
            );

            // var tag = pageDao.selectData(
		    //     id = tagId
            //     , selectFields = [ "id", "label", "featured" ]
            //     , orderBy      = "label"
            // );

            arrayAppend( args.blog_home, {
                tag  = queryRowToStruct( tag, 1 ),
                blogs  = queryToArray( blogPostTags )
            } );
        }

        return renderView(
              view          = 'page-types/homepage/_render_tag'
            , id            = event.getCurrentPageId()
            , args          = args
        );
    }
}