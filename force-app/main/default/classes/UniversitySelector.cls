/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description University selector class
 * @date 2019-10-01
 */
public class UniversitySelector extends ObjectSelector {
    /**
     * UniversitySelector constructor
     */
    public UniversitySelector() {
        super(University__c.getSObjectType());
    }

    /**
     * Selects a university by presentation id
     *
     * @param String presentationId
     * @return University__c
     */
    public University__c selectByPresentationId(String presentationId) {

        String template = 'SELECT {0}, University__r.Name FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id IN ({1})) LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'presentationId' });

        return (University__c)Database.query(query);
    }
}
