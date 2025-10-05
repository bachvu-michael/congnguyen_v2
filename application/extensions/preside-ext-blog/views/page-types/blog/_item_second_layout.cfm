<cfparam name="args.id" />
<cfparam name="args.title" />
<cfparam name="args.publish_date" />
<cfparam name="args.post_author" />
<cfparam name="args.teaser" />
<cfparam name="args.main_image" />
<cfparam name="args.mainImageDerivative" default="blogMainImageTeaserSmall" />

<cfscript>
    pageLink = event.buildLink( page=args.id );
	picture  = len(args.main_image) ? event.buildLink( assetId=args.main_image  ) : "/assets/img/banner_empty.jpg";
</cfscript>

<cfoutput>
    <li class="post-elem col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="second-layout-item post-item effect-04 style-bottom-info">
            <div class="thumbnail">
                <a href="#pageLink#" class="link-to-post"><img
                        src="#picture#"
                        width="370" height="270"
                        alt></a>
            </div>
            <div class="post-content">
                <h4 class="post-name"><a href="#pageLink#" class="linktopost">#args.title#</a></h4>
                <p class="post-date">Ngày đăng: #dateFormat( args.publish_date, "dd-mm-yyyy" )#</p>
                <p class="post-teaser">#args.teaser#</p>
            </div>
        </div>
    </li>
</cfoutput>
