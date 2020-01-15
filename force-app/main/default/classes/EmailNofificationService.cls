public class EmailNofificationService implements INotificationService {

    public Boolean notify(INotification notification) {
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email(notification) });
    }

    /**
     * Used to prepare a Messaging.SingleEmailMessage
     * 
     * @return Messaging.SingleEmailMessage
     */
    public Messaging.SingleEmailMessage email(INotification notification) {
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        email.setToAddresses( new String[]{ Misc.systemEmail() } );
        email.setHtmlBody( notification.body() );
        email.setSubject( notification.title() );
        
        return email;
    }
}
