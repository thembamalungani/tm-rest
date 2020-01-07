public class OpportunityHelper {
    
    /**
     * Prepares an opportunitu for the passed lead and account
     *
     * @param BaseLead lead
     * @param Account account
     * @return Opportunity
     */
    public static Opportunity prepareFor(BaseLead lead, Account account){

        Pricebook2 pricebook = (new PricebookSelector()).selectByName(Strings.STANDARD_PRICE_BOOK);

        Opportunity opportunity = new Opportunity(
            Name                            = OpportunityHelper.nameFor(lead),
            StageName                       = Strings.OP_STANE_NEW_INTEREST,
            CloseDate                       = Date.today().addMonths(1),
            Google_Analytics_Client_Id__c   = lead.tracking.googleAnalyticsClientId,
            Segment_Anonymous_Id__c         = lead.tracking.segmentAnonymousId,
            Lead_Capture_Form_URL__c        = lead.tracking.leadCaptureFormUrl,
            Lead_Capture_Form_Type__c       = getLeadCapturType(lead),
            AccountId                       = account.Id,
            Segment_Sync_Status__c          = Strings.SEGMENT_PENDING_SYNC,
            CurrencyIsoCode                 = Strings.CURRENCY_USD,
            Pricebook2Id                    = pricebook.Id
        );

        if (lead.tracking.productIds.size() == 1){
            opportunity.Inferred_Presentation__c = lead.tracking.productIds.get(0);
        }

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
     * Gets a lead capture type string by using api value
     *
     * @param String leadCaptureFormType
     * @return String
     */
    public static String getLeadCapturType(BaseLead lead) {

        if (lead.getType().equals(LeadType.CALENDLY_RAC_CREATED) || lead.getType().equals(LeadType.CALENDLY_RAC_CANCELED)) {
            return Strings.REQUEST_A_CALL;
        }

        return lead.tracking.leadCaptureFormType;
    }

    /**
     * Checks if the lead has an opportunity
     *
     * @param BaseLead lead
     * @param Account account
     * @return Opportunity
     */
    public static Opportunity checkOpportunity(BaseLead lead, Account account) {
        
        Opportunity tmpOpportunity = null;

        for (Opportunity opportunity : getAccountOpportunities(account)) {
            
            List<String> oppLineItemsProductUUIDs = getOpportunityLineItemsProductUUIDs(opportunity);

            for (String productUuid: lead.tracking.productIds) {
                if (!oppLineItemsProductUUIDs.contains(productUuid)){
                    tmpOpportunity = null;
                } else {
                    tmpOpportunity = opportunity;
                }
            }
        }
        
        return tmpOpportunity;
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
    public static List<String> getOpportunityLineItemsProductUUIDs(Opportunity opportunity) {

        List<OpportunityLineItem> lineItems = (new OpportunityLineItemSelctor()).selectByOpportunityIds(new Set<Id>{ opportunity.Id }).values();
        
        Set<Id> lineItemsProductIds        = new Set<Id>();
        List<String> lineItemsProductUUIDs  = new List<String>();

        for (OpportunityLineItem lineItem: lineItems) {
            lineItemsProductIds.add(lineItem.Product2Id);
        }

        Map<Id, Product2> presentations = (new PresentationSelector()).selectByIDs(lineItemsProductIds);

        if (presentations != null) {
            for (Product2 presentation : presentations.values()) {
                lineItemsProductUUIDs.add(presentation.Id);
            }
        }

        return lineItemsProductUUIDs;
    }
}