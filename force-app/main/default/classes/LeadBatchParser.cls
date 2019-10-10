/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This class is used to handle parsing a json string with a collection of leads
 * @date 2019-10-01
 */
public virtual class LeadBatchParser implements ILeadBatchParser {
    
    /**
     * The json string to be parsed
     *
     * @param String json
     */
    protected final String json;

    /**
     * The lead factory used to create lead objects
     *
     * @param ILeadFactory factory
     */
    protected ILeadFactory factory;

    /**ILeadMapperFactory
     * Pass the json to be parsed
     */
    public LeadBatchParser() {

        this.factory = (ILeadFactory) Application.Component.newInstance(ILeadFactory.class);
    }

    /**
     * Parses the json data a returns a list of BaseLead objects
     *
     * @param List<BaseLead>
     */
    public List<BaseLead> parse(String json) {
        
        List<BaseLead> leads = new List<BaseLead>();

        List<Object> events = (List<Object>) JSON.deserializeUntyped(json);

        for(Object event: events) {

            leads.add( this.factory.createFrom((Map<String, Object>) event));
        }

        return leads;
    }
}
