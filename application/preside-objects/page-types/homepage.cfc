/**
 * The homepage page type object is used to store any fields that are distinct to pages of type 'homepage'
 *
 * @isSystemPageType       true
 * @pageTypeViewlet        page-types.homepage.index
 * @parentSystemPageType   none
 * @allowedParentPageTypes none
 * @feature                siteTree
 */
component extends="preside.system.base.SystemPresideObject" displayName="Page type: Homepage" {
	property name="product_hight_light" type="string"  dbtype="text"  	required=false;
	property name="blog_tag"    type="string"  dbtype="text"  	required=false;
	property name="blog_list_for_homepage" relatedTo="blog" relationship="many-to-one"  required=false;
}