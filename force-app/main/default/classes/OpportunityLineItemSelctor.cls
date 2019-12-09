public class OpportunityLineItemSelctor extends ObjectSelector implements IOpportunityLineItemSelctor {
    /**
     * OpportunityLineItemSelctor cosntructor
     */
    public OpportunityLineItemSelctor() {
        super(OpportunityLineItem.getSObjectType());
    }

    /**
     * Selects opportunities by ids
     *
     * @param Set<Id> ids
     * @return Map<Id, OpportunityLineItem>
     */
    public Map<Id, OpportunityLineItem> selectByOpportunityIds(Set<Id> ids) {

        String template              = 'SELECT {0} FROM OpportunityLineItem WHERE OpportunityId IN :{1}';
        String query                 = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'ids' });
        List<OpportunityLineItem> lineItems       = Database.query(query);
        Map<Id, OpportunityLineItem> lineItemsMap = new Map<Id, OpportunityLineItem>();

        for (OpportunityLineItem lineItem : lineItems) {
            lineItemsMap.put(lineItem.Id, lineItem);
        }

        return lineItemsMap;
    }
}
