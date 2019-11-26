public class OpportunityHelper {
    
    public static Opportunity prepareFor(BaseLead lead, Account account){

        Opportunity opportunity = new Opportunity(
            Name                            = OpportunityHelper.nameFor(lead),
            StageName                       = 'New Interest',
            CloseDate                       = Date.today().addMonths(1),
            Google_Analytics_Client_Id__c   = lead.tracking.googleAnalyticsClientId,
            Segment_Anonymous_Id__c         = lead.tracking.segmentAnonymousId,
            Lead_Capture_Form_URL__c        = lead.tracking.leadCaptureFormUrl,
            Lead_Capture_Form_Type__c       = lead.tracking.leadCaptureFormType,
            AccountId                       = account.Id,
            Segment_Sync_Status__c          = 'New Opportunity Pending Synchronisation'
        );

        return opportunity;
    }

    /**
     * Creates a opportunity name fot the the lead
     *
     * @param BaseLead lead
     * @return String 
     */
    public static String nameFor(BaseLead lead) {
        return String.format('{0} {1}', new String[]{ lead.contactDetails.firstName, lead.contactDetails.lastName });
    }

}
