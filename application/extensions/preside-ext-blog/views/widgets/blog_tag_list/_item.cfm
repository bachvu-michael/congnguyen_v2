<cfparam name="args.id" />
<cfparam name="args.label" />
<cfparam name="args.post_count" />
<cfparam name="args.blog" />

<!--- TODO: i18n --->
<cfscript>
	tooltip = args.post_count gt 1 ? args.post_count & " posts" : "1 post";
    link = event.buildLink( page=args.blog, querystring="filterAction=redirect&filterType=tags&filterValue=" & args.id );
</cfscript>
<cfoutput>
	<li title="#tooltip#" class="cat-list-item"><a href="#link#" class="cat-link">#args.label# (#args.post_count#)</a></li>
</cfoutput>