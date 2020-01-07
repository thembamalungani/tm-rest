public class PresentationSelector extends ObjectSelector {
    /**
     * PresentationSelector cosntructor
     */
    public PresentationSelector() {
        super(Product2.getSObjectType());
    }

    /**
     * Selects presentations via uuid
     *
     * @param Set<String> productUuids
     * @return Map<String, Product2>
     */
    public Map<String, Product2> selectByUuid(Set<String> productUuids) {
        
        String template              = 'SELECT {0} FROM Product2 WHERE UUID__c IN :{1}';
        String query                 = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'productUuids' });
        List<Product2> presentations = Database.query(query);
        Map<String, Product2> presentationsMap = new Map<String, Product2>();

        for (Product2 presentation: presentations) {
            presentationsMap.put(presentation.UUID__c, presentation);
        }

        return presentationsMap;
    }

    /**
     * Selects presentations via id
     *
     * @param Set<Id> ids
     * @return Map<Id, Product2>
     */
    public Map<Id, Product2> selectByIDs(Set<Id> ids) {
        
        String template              = 'SELECT {0} FROM Product2 WHERE Id IN :{1}';
        String query                 = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'ids' });
        List<Product2> presentations = (List<Product2>)Database.query(query);

        if (presentations != null) {
            Map<Id, Product2> presentationsMap = new Map<Id, Product2>();

            for (Product2 presentation: presentations) {
                presentationsMap.put(presentation.Id, presentation);
            }
            return presentationsMap;
        }

        return null;
    }

    /**
     * Selects published presentations by course id
     *
     * @param String courseId
     * @return List<Product2>
     */
    public List<Product2> selectPublishedPresentationsByCourseId(String courseId) {
        
        String template = 'SELECT {0} FROM Product2 WHERE Course__c = :{1} AND Published__c = true AND Start_Date__c > TODAY ORDER BY Start_Date__c ASC';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });
        
        return (List<Product2>)Database.query(query);
    }

    /**
     * Selects unpublished presentations by course id
     *
     * @param String courseId
     * @return List<Product2>
     */
    public List<Product2> selectUnPublishedPresentationsByCourseId(String courseId) {
        
        String template = 'SELECT {0} FROM Product2 WHERE Course__c = {1} AND Published__c = false AND Start_Date__c > ORDER BY Start_Date__c ASC';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });
        
        return (List<Product2>)Database.query(query);
    }

    /**
     * Selects unpublished presentations by course id
     *
     * @param String courseId
     * @return List<Product2>
     */
    public List<Product2> selectEligiblePresentationsByCourseId(String courseId) {
        
        String template = 'SELECT {0} FROM Product2 WHERE Course__c = {1} AND Published__c = false ORDER BY Start_Date__c DESC';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'courseId' });
        
        return (List<Product2>)Database.query(query);
    }
}
