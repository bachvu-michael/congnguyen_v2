<cfscript>
	inputName    = args.name         ?: "";
	inputId      = args.id           ?: "";
	inputClass   = args.class        ?: "";
	placeholder  = args.placeholder  ?: "";
	defaultValue = args.defaultValue ?: "";
	basedOn      = args.basedOn      ?: "label";

	value  = event.getValue( name=inputName, defaultValue=defaultValue );
	if ( not IsSimpleValue( value ) ) {
		value = "";
	}
	args.savedData.slug = args.savedData.slug?:"";
    event.include( assetId="/js/specific/vnautoslug/" );
</cfscript>

<cfoutput>
	<input type="text" class="#inputClass# vn-auto-slug form-control" id="#inputId#"  data-preslug ="#args.savedData.SLUG#" placeholder="#placeholder#" name="#inputName#" value="#HtmlEditFormat( value )#" data-based-on="#basedOn#" tabindex="#getNextTabIndex()#">
</cfoutput>