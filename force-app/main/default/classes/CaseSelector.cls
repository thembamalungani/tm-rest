public class CaseSelector extends ObjectSelector implements ICaseSelector {
    /**
     * AccountSelector cosntructor
     */
    public CaseSelector() {
        super(Case.getSObjectType());
    }

    /**
     * Select a case by external ids
     *
     * @param List<string> ids
     * @return Case
     */
    public Case selectByExternalIds(List<string> ids){

        String template = 'SELECT {0} FROM Case WHERE Calendly_Event_Uuid__c IN :{1} LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'ids' });

        return (Case)Database.query(query);
    }
}