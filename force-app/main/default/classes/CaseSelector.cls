public class CaseSelector extends ObjectSelector implements ICaseSelector {
    /**
     * AccountSelector cosntructor
     */
    public CaseSelector() {
        super(Case.getSObjectType());
    }

    /**
     * Select a case by external id
     *
     * @param String id
     * @return Case
     */
    public Case selectByExternalId(String id){

        String template = 'SELECT {0} FROM Case WHERE Calendly_Event_Uuid__c=:{1} LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'id' });

        return super.query(query);
    }
}