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

component  {
	property name="title" 	required="true" ;
	property name="slug" 	control="vnautoSlug" required="true" basedOn="title" uniqueindexes="slug";
	property name="active" 	type="boolean" dbtype="boolean" required=false default=true;

	property name="og_locale" 			type="string"  dbtype="varchar" ;
	property name="og_type" 			type="string"  dbtype="varchar" ;
	property name="og_title" 			type="string"  dbtype="varchar" ;
	property name="og_description" 		type="string"  dbtype="varchar" ;
	property name="og_url" 				type="string"  dbtype="varchar" ;
	property name="og_site_name" 		type="string"  dbtype="varchar" ;
	property name="og_image" 			relationship="many-to-one" relatedTo="asset"   required=false allowedTypes="image";
}