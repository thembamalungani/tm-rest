public class OpportunityCreateFailedNotification implements INotification {
    
    private BaseLead lead;
    private String reason;

    public OpportunityCreateFailedNotification(BaseLead lead, String reason) {
        this.lead   = lead;
        this.reason = reason;
    }

    public String title() {
        return String.format('Create opportunity failed for: {0} on {1}', 
            new String[]{lead.contactDetails.email, Datetime.now().format()}
        ); 
    }

    public String body() {
        return String.format(
            'Failed to create lead for {0}<br>Reason: {1}<br>Payload: {2}', 
            new String[]{ lead.tracking.externalId, reason, JSON.serialize(lead) }
        );
    }
}
