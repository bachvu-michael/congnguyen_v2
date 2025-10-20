
<cfscript>
    if(isEmpty(args.recordCount)){
        args.recordCount = 1;
    }
    if(isEmpty(args.totalRecordCount)){
        args.totalRecordCount = args.recordCount;
    }


    numberPages = args.totalRecordCount/args.recordCount;
    if(numberPages > numberPages.int()){
        numberPages += 1;
    }

    currentPage = args.currentPage;
    if(!isNumeric(args.currentPage) || args.currentPage < 0){
        currentPage = 1;
    }
    linkReview =  event.buildLink( page=event.getCurrentPageId(), querystring="currentPage=" & ( currentPage - 1) );
    linkNext = event.buildLink( page=event.getCurrentPageId(), querystring="currentPage=" & ( currentPage + 1 ) );
</cfscript>
<cfoutput>
<div class="biolife-panigations-block ">
    <ul class="panigation-contain">
        <cfif currentPage gt 1>
            <li><a class="link-page" href="#linkReview#"><i class="fa fa-angle-left"></i></a></li>
        </cfif>

        <cfloop index="index" from="1" to="#numberPages#">
            <cfset link = event.buildLink( page=event.getCurrentPageId(), querystring="currentPage=" & ( index ) )>
            <li><a class="link-page #index == currentPage ? "current-page":""#" href="#link#">#index#</a></li>
        </cfloop>

        <cfif currentPage lt numberPages.int()>
            <li><a class="link-page" href="#linkNext#"><i class="fa fa-angle-right"></i></a></li>
        </cfif>
    </ul>
</div>
</cfoutput>

<!--- Panigation Block
<div class="biolife-panigations-block ">
    <ul class="panigation-contain">
        <li><span class="current-page">1</span></li>
        <li><a href="##" class="link-page">2</a></li>
        <li><a href="##" class="link-page">3</a></li>
        <li><span class="sep">....</span></li>
        <li><a href="##" class="link-page">20</a></li>
        <li><a href="##" class="link-page next"><i
                    class="fa fa-angle-right"
                    aria-hidden="true"></i></a></li>
    </ul>
</div>
    --->