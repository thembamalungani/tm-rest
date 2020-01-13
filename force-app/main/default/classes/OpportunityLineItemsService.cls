/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Service class for opportunity line items
 * @date 2019-10-21
 */
public with sharing class OpportunityLineItemsService extends SObjectService implements IOpportunityLineItemsService {
    /**
     * Creates opportunity line items
     * 
     * @param List<OpportunityLineItem> lineItems
     * @return 
     */
    public void createLineItems(List<OpportunityLineItem> lineItems) {
        super.insertObjects(lineItems);
    }
}
