component extends="preside.system.Bootstrap" {

	// see /preside/system/Bootstrap.cfc$setupApplication()
	// for further options
	super.setupApplication(
		  id                       = "congnguyen"
		, presideSessionManagement = true
	);
	this.charset = "UTF-8";
	this.encoding = { 
		request: "UTF-8", 
		template: "UTF-8" 
	};
	this.serialization.preserveCaseForStructKey=true;
	function onError() { dump( arguments ); abort; } 

}
