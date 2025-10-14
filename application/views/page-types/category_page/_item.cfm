<cfparam name="args.id" />
<cfparam name="args.title" />
<cfparam name="args.teaser" />
<cfparam name="args.slug" />
<cfparam name="args.main_image" />
<cfparam name="args.category_slug" />
<cfparam name="args.category_title" />
<cfparam name="args.datecreated" />
<cfparam name="args.product_highline" />
<cfparam name="args.product_new" />
<cfparam name="args.product_discount" />

<cfscript>
    pageLink = event.buildLink( linkto='#args.category_slug#.#args.slug#' );
    pageCategoryLink = event.buildLink( linkto='#args.category_slug#' );
    // dump(args);abort;
	picture  = len(args.main_image) ? event.buildLink( assetId=args.main_image  ) : "/assets/img/banner_empty.jpg";
</cfscript>

<cfoutput>
    <li
        class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div
            class="post-item effect-04 style-bottom-info">
            <div class="thumbnail">
                <a href="#pageLink#" class="link-to-post"><img
                        src="#picture#"
                        width="370" height="270"
                        alt></a>
            </div>
            <div class="post-content">
                <h4 class="post-name"><a href="#pageLink#"
                        class="linktopost">#args.title#</a></h4>
                <p class="excerpt">#args.teaser#</p>
            </div>
        </div>
    </li>
</cfoutput>