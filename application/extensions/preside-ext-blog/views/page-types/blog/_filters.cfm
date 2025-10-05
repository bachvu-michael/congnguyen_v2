<cfparam name="args.blogId" />
<cfparam name="args.authors" />
<cfparam name="args.archives" />
<cfparam name="args.tags" />

<cfif !isEmpty( args.authors ) || !isEmpty( args.archives ) || !isEmpty( args.tags )>
    <cfoutput>
        <div class="filter-tags">
            <!--- TODO: i18n --->
            <span class="filter-tags-label">Kết quả cho:</span>
            <cfloop query="args.authors">
                <cfset link = event.buildLink( page=args.blogId, querystring="filterAction=remove&filterType=authors&filterValue=" & id ) />
                <a href="#link#" class="badge badge-success filter-tags-item">
                    #name#
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </cfloop>
            <cfloop query="args.archives">
                <cfset link = event.buildLink( page=args.blogId, querystring="filterAction=remove&filterType=archives&filterValue=" & key ) />
                <a href="#link#" class="badge badge-success filter-tags-item">
                    #label#
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </cfloop>
            <cfloop query="args.tags">
                <cfset link = event.buildLink( page=args.blogId, querystring="filterAction=remove&filterType=tags&filterValue=" & id ) />
                <a href="#link#" class="badge badge-success filter-tags-item">
                    #label#
                    <i class="fa fa-times" aria-hidden="true"></i>
                </a>
            </cfloop>
        </div>
    </cfoutput>
</cfif>