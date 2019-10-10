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
        
        ILeadTypeChecker checker = (ILeadTypeChecker) Application.Component.newInstance(ILeadTypeChecker.class);
        LeadType type = checker.check(leadMap);
        IMappable model = (IMappable) Application.Model.newInstance(type);
        AbstractLeadMapper mapper = (AbstractLeadMapper) Application.LeadMapper.newInstance(type);

        mapper.setMap(leadMap);

        return (BaseLead) model.fromMapper(mapper);
    }
}
