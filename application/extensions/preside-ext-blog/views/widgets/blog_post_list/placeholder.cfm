<cfparam name="args.blogTitle" default="" />
<cfparam name="args.title" default="" />
<cfparam name="args.top_posts_only" default="" />
<cfparam name="args.most_viewed" default="" />
<cfparam name="args.max_items" default="" />

<cfscript>
    widgetTitle = translateResource( uri="widgets.blog_post_list:title" );
    widgetTitleFieldTitle = translateResource( uri="widgets.blog_post_list:field.title.title" );
    blogPagetypeName = translateResource( uri="page-types.blog:name" );

    widgetConfigurationDetails = [];

    if ( len( blogPagetypeName ) && len( args.blogTitle ) ) {
        widgetConfigurationDetails.append( blogPagetypeName & ": " & args.blogTitle );
    }

    if ( len( widgetTitleFieldTitle ) && len( args.title ) ) {
        widgetConfigurationDetails.append( widgetTitleFieldTitle & ": " & args.title );
    }

    placeholder = widgetTitle;

    if ( !isEmpty( widgetConfigurationDetails ) ) {
        placeholder &= " (" & widgetConfigurationDetails.toList( ", ") & ")";
    }
</cfscript>
<cfoutput>#placeholder#</cfoutput>