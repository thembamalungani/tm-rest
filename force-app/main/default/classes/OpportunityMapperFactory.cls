/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Opportunity mapper factory
 * @date 2019-11-11
 */
public class OpportunityMapperFactory {
    
    /**
     * Create an insatnce of opportunity mapper
     *
     * @param BaseLead lead
     * @return OpportunityMapper
     */
    public static OpportunityMapper getMapper(BaseLead lead) {
        
        return new OpportunityMapper();
    }
}
