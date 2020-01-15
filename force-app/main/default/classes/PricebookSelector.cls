/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Selector class for price books
 * @date 2019-10-21
 */
public class PricebookSelector extends ObjectSelector {
    /**
     * PricebookSelector constructor
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
        
        return (Pricebook2)Database.query(query);
    }
}
