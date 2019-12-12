public class UniversitySelector extends ObjectSelector {
    /**
     * UniversitySelector cosntructor
     */
    public UniversitySelector() {
        super(University__c.getSObjectType());
    }

    /**
     * Selects a university by course id
     *
     * @param String courseId
     * @return University__c
     */
    public University__c selectByCourseId(String courseId) {

        String template = 'SELECT {0} FROM University__c WHERE Id IN (SELECT University__c FROM Course__c WHERE Id=:{1}) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });

        return super.query(query);
    }
}
