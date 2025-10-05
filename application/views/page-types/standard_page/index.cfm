<!---@feature sitetree--->
<cf_presideparam name="args.title"         field="page.title"         />
<cf_presideparam name="args.main_content"  field="page.main_content"  />

<cfoutput>
	<div class="container">
		#args.main_content#
	</div>
</cfoutput>