public class FacultySelector extends ObjectSelector {
    /**
     * FacultySelector cosntructor
     */
    public FacultySelector() {
        super(Faculty__c.getSObjectType());
    }

    /**
     * Selects a faculty by course id
     *
     * @param String courseId
     * @return Faculty__c
     */
    public Faculty__c selectByCourseId(String courseId) {

        String template = 'SELECT {0} FROM Faculty__c WHERE Id IN (SELECT Faculty__c FROM Course__c WHERE Id=:{1}) LIMIT 1]';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });
        
        return Database.query(query);
    }
}
