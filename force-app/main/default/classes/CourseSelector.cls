/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Selector class for Course__c
 * @date 2019-10-04
 */
public class CourseSelector extends ObjectSelector {
    /**
     * CourseSelector cosntructor
     */
    public CourseSelector() {
        super(Course__c.getSObjectType());
    }

    /**
     * Selects a course by UUID
     *
     * @param String uuid
     * @return Course__c
     */
    public Course__c selectByUuid(String uuid) {
        
        String template = 'SELECT {0}, University__r.University_Name__c, School__r.Name, Faculty__r.Name FROM Course__c WHERE UUID__c = :{1}';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'uuid' });

        return (Course__c)Database.query(query);
    }

    /**
     * Selects a course by presentation id
     *
     * @param String presentationId
     * @return Course__c
     */
    public Course__c selectByPresentationId(String presentationId) {
        
        String template = 'SELECT {0}, University__r.University_Name__c, School__r.Name, Faculty__r.Name FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id IN (:{1})) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'presentationId' });

        return (Course__c)Database.query(query);
    }
}
