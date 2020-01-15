/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Selector class for School__c
 * @date 2019-10-21
 */
public class SchoolSelector extends ObjectSelector {
    /**
     * SchoolSelector constructor
     */
    public SchoolSelector() {
        super(School__c.getSObjectType());
    }

    /**
     * Selects a school by presentation id
     *
     * @param String presentationId
     * @return School__c
     */
    public School__c selectByPresentationId(String presentationId) {

        String template = 'SELECT {0}, School__r.Name FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id IN ({1})) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'presentationId' });

        return (School__c)Database.query(query);
    }
}