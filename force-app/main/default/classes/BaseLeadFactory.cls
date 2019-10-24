/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the factory class which is used to create lead objects
 * @date 2019-10-01
 */
public virtual class BaseLeadFactory implements ILeadFactory {

    /**
     * Create a lead instance from a lead map
     *
     * @param Map<String, Object> leadMap
     * @throws UnsupportedLeadTypeException
     * @return BaseLead
     */
    public BaseLead createFrom(Map<String, Object> leadMap) {
        
        LeadType type;
        BaseLead lead;
        IMappable model;
        ILeadTypeChecker checker;
        AbstractLeadMapper mapper;

        checker = new LeadTypeChecker();
        type    = checker.check(leadMap);
        model   = new BaseLead();
        mapper  = new AbstractLeadMapper();

        mapper.setMap(leadMap);
        model.setMapper(mapper);

        lead = (BaseLead) model.fromMapper();

        lead.setType(type);
        
        return lead;
    }
}
