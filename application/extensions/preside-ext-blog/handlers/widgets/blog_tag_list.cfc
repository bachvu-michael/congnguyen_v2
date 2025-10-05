component {

	property name="blogService" inject="blogService";
    property name="blogDao" inject="presidecms:object:blog";

	private function index( event, rc, prc, args={} ) {
		var featured = listFindNoCase("true,1,yes,on", args.featured) GT 0;
		args.tags = blogService.getBlogPostTags( parentPage=( args.blog ?:"invalidId" ), featuredOnly=featured );
		
		return renderView( view='widgets/blog_tag_list/index', args=args );
	}

	private function placeholder( event, rc, prc, args={} ) {

        var blog       = blogDao.selectData( id=args.blog, selectFields=[ "page.title" ] );
        args.blogTitle = blog.title;

		return renderView( view='widgets/blog_tag_list/placeholder', args=args );
	}
}