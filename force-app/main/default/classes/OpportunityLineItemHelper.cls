public class OpportunityLineItemHelper {
    /**
     * Prepares an product line items 
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return List<OpportunityLineItem>
     */
    public static List<OpportunityLineItem> prepareFor(BaseLead lead, Account account, Opportunity opportunity) {

        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();

        Set<String> presentationUUIDs = new Set<String>();

        for (String presentationUUID : lead.tracking.productIds) {
            presentationUUIDs.add(presentationUUID);
        }

        Map<String, Product2> presentations = (new PresentationSelector()).selectByUuid(presentationUUIDs);

        for (String productId : getPresentationIds(presentations)) {
            
            Double totalPrice = 0;

            for (Product2 presentation: presentations.values()) {
                
                if (presentation.Id == productId) {
                    totalPrice = presentation.Price__c;
                }
            }

            OpportunityLineItem lineItem = new OpportunityLineItem(
                OpportunityId=opportunity.Id,
                Product2Id=productId,
                Quantity=1,
                TotalPrice=totalPrice
            );  

            lineItems.add(lineItem);
        }

        return lineItems;
    }

    /**
     * Gets presentation IDs via uuids
     *
     * @param Map<String, Product2> presentations
     * @return Set<Id>
     */
    public static Set<Id> getPresentationIds(Map<String, Product2> presentations) {

        Set<Id> presentationIds = new Set<Id>();

        for (Product2 presentantion : presentations.values()) {
            presentationIds.add(presentantion.Id);
        }

        return presentationIds;
    }
}
