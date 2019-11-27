public class OpportunityLineItemHelper {
    
    public static List<OpportunityLineItem> prepareFor(BaseLead lead, Account account, Opportunity opportunity) {

        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();

        for (String productId : lead.tracking.productIds) {
            
            OpportunityLineItem lineItem = new OpportunityLineItem(
                OpportunityId=opportunity.Id,
                Product2Id=productId,
                Quantity=1
            );  

            lineItems.add(lineItem);
        }

        return lineItems;
    }
}
