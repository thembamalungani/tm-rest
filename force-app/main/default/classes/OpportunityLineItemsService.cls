public with sharing class OpportunityLineItemsService extends SObjectService implements IOpportunityLineItemsService {

    public void createLineItems(List<OpportunityLineItem> lineItems) {
        super.insertObjects(lineItems);
    }
}
