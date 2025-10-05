<cfparam name="args.id" default />
<cfparam name="args.title" default />
<cfparam name="args.slug" default />
<cfparam name="args.main_image" default />
<cfscript>
// /asset/E3AD4086%2DF582%2D403F%2DBE292E0060AA7596/
// /asset/04F004BA%2DA5CB%2D40FA%2DA5B307F944D56F27/
	picture  = len(args.main_image) ? event.buildLink( assetId=args.main_image  ) : "/assets/img/banner_empty.jpg";
    pageLink = event.buildLink( page=args.id );

</cfscript>
<cfoutput>
    <li>
        <div class="post-item effect-01 style-bottom-info layout-02 ">
            <div class="thumbnail">
                <a href="#pageLink#" class="link-to-post"><img
                        src="#picture#"
                        width="270" height="200"
                        alt></a>
            </div>
            <div class="post-content">
                <h4 class="post-name"><a href="##"
                        class="linktopost">#args.title#</a></h4>
            </div>
        </div>
    </li>
</cfoutput>