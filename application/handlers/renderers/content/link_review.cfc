component {

	public string function default( event, rc, prc, args={} ){
		var data = args.data ?: "";
		
		return data;
	}
	private string function adminDataTable( event, rc, prc, args={} ){
		// var data = args.data.listChangeDelims(",", "<br/>") ?: "";
		return renderView( view="/renderers/link_review/index", args=args);
	}

	private string function adminView( event, rc, prc, args={} ){
		// var data = args.data.listChangeDelims(",", "<br/>") ?: "";
		return renderView( view="/renderers/link_review/index", args=args);
	}
}