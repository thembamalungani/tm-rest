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

        String template = 'SELECT {0} FROM Case WHERE Id=:{1}';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'id' });

        return Database.query(query);
    }
}
