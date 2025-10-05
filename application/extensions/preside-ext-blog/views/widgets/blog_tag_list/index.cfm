<cfparam name="args.title" default="" />
<cfparam name="args.blog" default="" />

<cfif !isEmpty( args.tags )>
	<cfoutput>
		<div class="widget biolife-filter">
			<cfif args.title.len()>
				<h4 class="wgt-title">#args.title#</h4>
			</cfif>
			<div class="wgt-content">
				<ul class="cat-list">
					<cfloop query="args.tags">
						#renderView( view='widgets/blog_tag_list/_item', args={
								id 		= id
							, label 	= label
							, post_count = post_count
							, blog	    = args.blog
						} )#
					</cfloop>		
				</ul>
			</div>
		</div>
	</cfoutput>
</cfif>