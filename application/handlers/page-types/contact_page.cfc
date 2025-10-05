component {
	private function index( event, rc, prc, args={} ) {
		// TODO: create your handler logic here
		return renderView(
			  view          = 'page-types/contact_page/index'
			, presideObject = 'contact_page'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
