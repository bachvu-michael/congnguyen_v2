component implements="preside.system.services.routeHandlers.iRouteHandler" singleton=true {

        property name="dumpLogService" inject="dumpLogService";
        property name="presideObjectService" inject="presideObjectService";

        /**
         * @eventName.inject coldbox:setting:eventName
         * @assetManagerService.inject assetManagerService
         */
        public any function init( required string eventName, required any assetManagerService ) output=false {
            _setEventName( arguments.eventName );
            return this;
        }

        // route handler methods
        public boolean function match( required string path, required any event ) output=false {
            
            var pathProduct = listToArray(arguments.path,"/")
            var isHtmlPage =  find('.html',arguments.path)
            if( !isHtmlPage 
                && (pathProduct.len() == 1 || pathProduct.len() == 2)
                && pathProduct[1] != "admin" 
                && pathProduct[1] != "asset"
                && pathProduct[1] != "preside"
                ){
                    return true;
            }else{
                return false;
            }
        }

        public void function translate( required string path, required any event ) output=false {
            // var tagSlug = UrlDecode( UrlDecode( ReReplace( arguments.path, "^/tag/(.*?)/.*$", "\1" ) ) );
            // tagSlug = ListFirst( tagSlug, "." );
            // tagSlug = ReReplace( tagSlug, "^[_\$]", "" );
            event.setValue( "pathString"  , arguments.path );
            event.setValue( "event", "page-types.category_page.renderViewList" );
        }

        public boolean function reverseMatch( required struct buildArgs, required any event ) output=false {
            return Len( Trim( buildArgs.tagSlug ?: "" ) );
            // return Len( Trim( buildArgs.registerSlug ?: "" ) );
        }
    
        public string function build( required struct buildArgs, required any event ) output=false {
            // return event.getSiteUrl( includePath=false ) & "/bachbach/#buildArgs.registerSlug#/";
        }

           // private getters and setters
        private string function _getEventName() output=false {
            return _eventName;
        }
        private void function _setEventName( required string eventName ) output=false {
            _eventName = arguments.eventName;
        }

    }