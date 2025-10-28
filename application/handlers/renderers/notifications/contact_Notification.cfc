component {
	private function dataTable( event, rc, prc, args={} ) {
		// TODO: create your handler logic here
		return "lien he";
	}
 private string function full( event, rc, prc, args={} ) {
		// return renderView( view = '/renderers/notifications/contact_Notification/full', args = args );
		setNextEvent( url=event.buildAdminLink( objectName="contact_info", operation="viewRecord",recordId=args.contactInfo ) );
 }
}
