/**
 * Sticker bundle configuration file. See: http://sticker.readthedocs.org/
 */
component {

	public void function configure( bundle ) {

		// bundle.addAssets(
		// 	  directory   = "/"
		// 	, match       = function( filepath ){ return ReFindNoCase( "\.(js|css)$", filepath ); }
		// 	, idGenerator = function( filepath ){
		// 		var fileName = ListLast( filePath, "/" );
		// 		var id       = ListLast( filename, "." ) & "-" & ReReplace( filename, "\.(js|css)$", "" );
		// 		return id;
		// 	  }
		// );
		bundle.addAsset( id="css-test"               , path="/css/custom.css"                                       );

		bundle.addAssets(
			  directory   = "/css/"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.css$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);
		bundle.addAssets(
			  directory   = "/js/"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);
		////////////
		bundle.addAssets(
			directory   = "/js"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);//for live

		bundle.addAssets(
			directory   = "/js"
			, match       = function( path ){ return ReFindNoCase( "_dev\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);//for developer

		// bundle.asset( "css-bootstrap" ).before( "*" );
		// bundle.asset( "js-bootstrap" ).dependsOn( "js-jquery" );
	}

}