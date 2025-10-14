<cfparam name="args.id" default />
<cfparam name="args.title" default />
<cfparam name="args.slug" default />
<cfparam name="args.main_image" default />
<cfscript>
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