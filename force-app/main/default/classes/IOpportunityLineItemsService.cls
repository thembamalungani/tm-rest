/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for opportunity line items service
 * @date 2019-10-03
 */
public interface IOpportunityLineItemsService { 
    /**
     * Creates line items
     * 
     * @param List<OpportunityLineItem> lineItems
     * @return 
     */
    void createLineItems(List<OpportunityLineItem> lineItems);
}
