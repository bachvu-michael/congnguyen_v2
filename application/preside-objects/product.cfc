/*
 * This preside object has been scaffolded by the Preside dev tools scaffolder
 *
 * For speed of scaffolding, we have just created all your properties with the default
 * settings. You will almost certainly want to define your properties in more detail
 * here. Some examples:
 *
 * property name="myTextField" type="string" dbtype="varchar" maxLength=200 required=true uniqueindexes="myUX|2";
 * property name="myFlag" type="boolean" dbtype="boolean" required=false default=false;
 * property name="somecategory" relationship="many-to-one" relatedto="some_category_object" required=true uniqueindexes="myUX|1;
 *
 * You should remove this comment once you are done with it.
 */
 
/**
 * @dataManagerGroup product
 * @labelField title
 * @datamanagerGridFields title,slug,datecreated,datemodified
 */

component {
	property name="title"        		type="string"  dbtype="varchar"  maxLength="200" required=true control="textinput";
	property name="slug" 				control="vnautoSlug" required="true" basedOn="title" uniqueindexes="slug";

	property name="teaser"       		type="string"  dbtype="varchar"   maxLength="500" 	 required=false;
	property name="main_content" 		type="string"  dbtype="text"                     required=false;
	property name="main_image"   		relationship="many-to-one" relatedTo="asset"     required=false allowedTypes="image" ondelete="set-null-if-no-cycle-check" onupdate="cascade-if-no-cycle-check";
	property name="list_product_image"   		type="string" dbtype="text" control="assetpicker"  allowtypes="png,jpg"  multiple="true" sortable="true" quickadd="true" quickedit="true";

	property name="author"           	relationship="many-to-one" relatedTo="blog_author" ;
	property name="product_highline"     		type="boolean" dbtype="boolean"                  required=false default=false;
	property name="product_new"     	type="boolean" dbtype="boolean"                  required=false default=false;
	property name="product_discount"    type="boolean" dbtype="boolean"                  required=false default=false;

	property name="category" 	  		relationship="many-to-one" relatedTo="category" required=true;

	property name="noIndex" 			type="string" dbtype="varchar" control="yesNoSwitch" ;
	property name="noFollow" 			type="string" dbtype="varchar" control="yesNoSwitch" ;
	property name="headerScript" 			type="string"  dbtype="text" control="textarea";
	property name="review" 	type="string"  	dbtype="varchar" formula="CONCAT( 'https://','#cgi.http_host#', '/', slug,'/')"  control="none" adminrenderer="link_review";

	// property name="title_tab" 			type="string"  dbtype="varchar" ;
	// property name="description_tab" 	type="string"  dbtype="varchar" ;
	property name="og_locale" 			type="string"  dbtype="varchar" ;
	property name="og_type" 			type="string"  dbtype="varchar" ;
	property name="og_title" 			type="string"  dbtype="varchar" ;
	property name="og_description" 		type="string"  dbtype="varchar" ;
	property name="og_url" 				type="string"  dbtype="varchar" ;
	property name="og_site_name" 		type="string"  dbtype="varchar" ;
	property name="og_image" 			relationship="many-to-one" relatedTo="asset"   required=false allowedTypes="image";
}