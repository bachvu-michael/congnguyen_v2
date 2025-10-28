<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->

<cfparam name="args.contactInfo" type="string" />
<cfscript>
    link  = event.buildAdminLink( objectName="contact_info", operation="viewRecord", recordId=args.contactInfo )
</cfscript>
<cfoutput>
    <div class="alert alert-danger">
        <h3><i class="fa fa-fw fa-user">
            
        </i> Customer contact <a href="#link#">here</a></h3>
        <!---
        <p>#HtmlEditFormat( args.complaint.complaint )#</p>
        --->
    </div>
</cfoutput>



