public class SchoolSelector extends ObjectSelector {
    /**
     * SchoolSelector cosntructor
     */
    public SchoolSelector() {
        super(School__c.getSObjectType());
    }

    /**
     * Selects a school by course id
     *
     * @param String id
     * @return School__c
     */
    public School__c selectByCourseId(String courseId) {

        String template = 'SELECT {0} WHERE Id IN (SELECT School__c FROM Course__c WHERE Id=:{1}) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });

        return super.query(query);
    }

}
