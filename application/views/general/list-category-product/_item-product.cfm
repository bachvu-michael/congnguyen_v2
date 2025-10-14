<cfscript>
    // pageLink = event.buildLink( linkto='#args.category_slug#.#args.slug#' );
    // dump(prc.listProduct);
    // dump(prc);abort;
    products = prc.listProduct;
</cfscript>
<cfoutput>
<cfloop query="products">
<cfscript>
	picture  = len(main_image) ? event.buildLink( assetId=main_image  ) : "/assets/img/banner_empty.jpg";
    pageLink = event.buildLink( linkto='#category_slug#.#product_slug#' );
</cfscript>
    <li>
        <div class="post-item effect-01 style-bottom-info layout-02 ">
            <div class="thumbnail">
                <a href="#pageLink#" class="link-to-post"><img
                        src="#picture#"
                        width="270" height="200"
                        alt></a>
            </div>
            <div class="post-content">
                <h4 class="post-name"><a href="#pageLink#"
                        class="linktopost">#product_title#</a></h4>
            </div>
        </div>
    </li>
</cfloop>
  
</cfoutput>