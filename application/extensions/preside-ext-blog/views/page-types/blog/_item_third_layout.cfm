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
    <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="post-item effect-04 style-bottom-info">
            <div class="thumbnail">
                <a href="#pageLink#" class="link-to-post"><img src="#picture#" width="370" height="270" alt=""></a>
            </div>
            <div class="post-content">
                <h4 class="post-name"><a href="#pageLink#" class="linktopost">#args.title#</a></h4>
                <p class="post-archive"><b class="post-cat">Ngày đăng:</b><span class="post-date"> / #dateFormat( args.publish_date, "dd-mm-yyyy" )#</span><span class="author">tác giả: #args.post_author#</span></p>
                <p class="excerpt">#args.teaser#</p>
            </div>
        </div>
    </li>
</cfoutput>
