public class CourseSelector extends ObjectSelector {
    /**
     * CourseSelector cosntructor
     */
    public CourseSelector() {
        super(Course__c.getSObjectType());
    }

    /**
     * Selects a course by id
     *
     * @param String id
     * @return Course__c
     */
    public Course__c selectByCourseId(String uuid) {
        
        String template              = '[SELECT {0} FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id=:{1}) LIMIT 1]';
        String query                 = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'uuid' });

        return Database.query(query);
    }
}
