public class PricebookEntrySelector extends ObjectSelector {

    /**
     * PricebookEntrySelector cosntructor
     */
    public PricebookEntrySelector() {
        super(PricebookEntry.getSObjectType());
    }

    /**
     * Selects the price book entry id for the product
     *
     * @param String productId
     * @return Id
     */
    public PricebookEntry selectByProductId(String productId){
        
        String template = 'SELECT {0} FROM PricebookEntry WHERE Product2Id=:{1} LIMIT 1';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'productId' });

        return (PricebookEntry)Database.query(query);
    }
}
