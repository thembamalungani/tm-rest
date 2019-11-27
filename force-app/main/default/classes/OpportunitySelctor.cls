public class OpportunitySelctor extends ObjectSelector implements IOpportunitySelector {

    /**
     * OpportunitySelctor cosntructor
     */
    public OpportunitySelctor() {
        super(Opportunity.getSObjectType());
    }

    public Map<Id, Opportunity> selectByAccountIds(Set<Id> accountIds) {

        String template                         = 'SELECT {0} FROM Opportunity WHERE Id IN :{1}';
        String query                            = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'accountIds' });
        List<Opportunity> opportunities         = Database.query(query);
        Map<Id, Opportunity> opportunitiesMap   = new Map<Id, Opportunity>();

        for (Opportunity opportunity : opportunities) {
            opportunitiesMap.put(opportunity.Id, opportunity);
        }

        return opportunitiesMap;
    }
}
