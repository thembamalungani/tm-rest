/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for faculty selector
 * @date 2019-10-04
 */
public class FacultySelector extends ObjectSelector {
    /**
     * FacultySelector constructor
     */
    public FacultySelector() {
        super(Faculty__c.getSObjectType());
    }

    /**
     * Selects a school by presentation id
     *
     * @param String presentationId
     * @return School__c
     */
    public Faculty__c selectByPresentationId(String presentationId) {

        String template = 'SELECT {0}, Faculty__r.Name FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id IN ({1})) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'presentationId' });

        return (Faculty__c)super.query(query);
    }
}
