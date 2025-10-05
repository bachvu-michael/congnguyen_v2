<cfparam name="args.title" default="" />
<cfparam name="args.collapse_on_mobile" default="false" />
<cfscript>
	// dump( args );
	// abort;
</cfscript>
<cfif args.blogPosts.recordCount gt 0>
	<cfsilent>
		<cfset cssClass = "widget widget-list" />
		<cfif isBoolean( args.collapse_on_mobile ) && args.collapse_on_mobile>
			<cfset cssClass &= " mod-mobile-collapse" />
		</cfif>
	</cfsilent>
	<cfoutput>
		<div class="widget posts-widget #cssClass#">
			<cfif args.title.len()>
				<h4 class="wgt-title">#args.title#</h4>
			</cfif>
			<div class="wgt-content">
				<ul class="posts">
					<cfloop query="args.blogPosts">	
						<cfscript>
							picture  = len(main_image) ? event.buildLink( assetId=main_image  ) : "/assets/img/banner_empty.jpg";
						</cfscript>
						<li>
							<div class="wgt-post-item">
								<div class="thumb">
									<a href="#event.buildLink( page=id )#"><img
											src="#picture#"
											width="80" height="58"
											alt></a>
								</div>
								<div class="detail">
									<h4 class="post-name"><a
											href="#event.buildLink( page=id )#">#title#</a></h4>
									<p class="post-archive">#dateFormat(publish_date, "dd-mm-yyyy")#</p>
								</div>
							</div>
						</li>
					</cfloop>
				</ul>
			</div>
		</div>
	</cfoutput>
</cfif>