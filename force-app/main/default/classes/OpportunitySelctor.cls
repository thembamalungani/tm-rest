/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Selector class for opportunities
 * @date 2019-10-21
 */
 public class OpportunitySelctor extends ObjectSelector implements IOpportunitySelector {
    /**
     * OpportunitySelctorCreateOpportunityLineItemsStage cosntructor
     */
    public OpportunitySelctor() {
        super(Opportunity.getSObjectType());
    }

    /**
     * Selects accounts by account ids
     *
     * @param Set<Id> accountIds
     * @return Map<Id, Opportunity>
     */
    public Map<Id, Opportunity> selectByAccountIds(Set<Id> accountIds) {

        String template                         = 'SELECT {0} FROM Opportunity WHERE AccountId IN :{1}';
        String query                            = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'accountIds' });
        List<Opportunity> opportunities         = Database.query(query);
        Map<Id, Opportunity> opportunitiesMap   = new Map<Id, Opportunity>();

        for (Opportunity opportunity : opportunities) {
            opportunitiesMap.put(opportunity.Id, opportunity);
        }

        return opportunitiesMap;
    }
}
