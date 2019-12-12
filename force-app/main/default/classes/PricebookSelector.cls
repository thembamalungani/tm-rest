public class PricebookSelector extends ObjectSelector {
    /**
     * PricebookSelector cosntructor
     */
    public PricebookSelector() {
        super(Pricebook2.getSObjectType());
    }

    /**
     * Selects a prive book by name
     *
     * @param String name
     * @return Pricebook2
     */
    public Pricebook2 selectByName(String name) {
        
        String template = 'SELECT {0} FROM Pricebook2 WHERE Name=:{1}';
        String query    = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'name' });

        return super.query(query);
    }
}
