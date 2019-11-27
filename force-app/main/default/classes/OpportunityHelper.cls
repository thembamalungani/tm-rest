public class OpportunityHelper {
    
    /**
     * Prepares an opportunitu for the passed lead and account
     *
     * @param BaseLead lead
     * @param Account account
     * @return Opportunity
     */
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

    /**
     * Checks if the lead has an opportunity
     *
     * @param BaseLead lead
     * @param Account account
     * @return Opportunity
     */
    public static Opportunity checkOpportunity(BaseLead lead, Account account) {
        
        for (Opportunity opportunity : getAccountOpportunities(account)) {
            if (lead.tracking.productIds.equals( getOpportunityLineItemsProductsIds(opportunity) )) {
                return opportunity;
            }
        }

        return null;
    }

    /**
     * Gets all opportunities for the account
     *
     * @param Account account
     * @return List<Opportunity>
     */
    public static List<Opportunity> getAccountOpportunities(Account account) {
        return (new OpportunitySelctor()).selectByAccountIds(new Set<Id>{ account.Id }).values();
    }

    /**
     * Gets the line items product ids for the passed opportunity
     *
     * @param Opportunity opportunity
     * @return List<String>
     */
    public static List<String> getOpportunityLineItemsProductsIds(Opportunity opportunity) {

        List<OpportunityLineItem> lineItems = (new OpportunityLineItemSelctor()).selectByOpportunityIds(new Set<Id>{ opportunity.Id }).values();
        List<String> lineItemsProductIds    = new List<String>();

        for (OpportunityLineItem lineItem: lineItems) {
            lineItemsProductIds.add(lineItem.Product2Id);
        }

        return lineItemsProductIds;
    }
}
