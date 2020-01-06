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
        Map<String, Product2> presentations = (new PresentationSelector()).selectByUuid(new Set<String>(lead.tracking.productIds));

        for (String productId : lead.tracking.productIds) {
            lineItems.add(new OpportunityLineItem(
                OpportunityId   = opportunity.Id,
                Product2Id      = productId,
                Quantity        = 1,
                PricebookEntryId= getPriceBookEntryId(productId),
                TotalPrice      = getPresentationPrice(productId, presentations.values())
            ));
        }

        return lineItems;
    }

    /**
     * Gets the price of the presentation with the passed product ids
     *
     * @param String productId
     * @param List<Product2> presentations
     * @return Double
     */
    public static Double getPresentationPrice(String productId, List<Product2> presentations){
        
        Double totalPrice = 0;

        for (Product2 presentation: presentations) {
            if (presentation.Id == productId) {
                totalPrice = presentation.Price__c;
            }
        }

        return totalPrice;
    }

    /**
     * Gets the price book entry id for the product
     *
     * @param String productId
     * @return Id
     */
    public static Id getPriceBookEntryId(String productId){
        
        try {

            PricebookEntry entry = (new PricebookEntrySelector()).selectByProductId(productId);

            if (entry != null) return entry.Id;

        } catch(Exception e){
            
            System.debug('Error while getting price book entry for: ' + productId);
        }
        
        return null;
    }
}
