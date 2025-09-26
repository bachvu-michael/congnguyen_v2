<cfscript>
	environment           = getSetting( name="environment", defaultValue="unknown" );
	reloadPassword        = getSetting( name="coldbox.reinitPassword", defaultValue=true );
	hasTerminalPermission = event.getModel( "permissionService" ).hasPermission( permissionKey = "devtools.console" );
</cfscript>
<cfif isFeatureEnabled( "devQuickLinks" ) and environment eq "local" and hasTerminalPermission>
    <cfoutput>
        <div class="pull-right">
            <a href="javascript:presideTerminal.toggle();">console</a>
            |
            <a href="javascript:var q=(new URLSearchParams(window.location.search));if(!q.has('fwreinit')){q.append('fwreinit', '#reloadPassword#');}else{q.set('fwreinit', '#reloadPassword#');} window.location.search = q.toString();">re-init</a>
        </div>
    </cfoutput>
</cfif>