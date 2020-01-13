/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to create a mapper instance based on lead type
 * @date 2019-10-01
 */
public class AccountMapperFactory {
    /**
     * Gets an account mapper based on lead
     *
     * @param BaseLead lead
     * @return IAccountMapper
     */
    public static IAccountMapper getMapper(BaseLead lead) {
        
        IAccountMapper mapper;

        if ( isCalendly(lead) ) {
            mapper = new CalendlyAccountMapper();
        } else {
            mapper = new CuriosityAccountMapper();
        }

        return mapper;
    }

    /**
     * Checks if the lead is a calendly event
     *
     * @param BaseLead lead
     * @return Boolean
     */
    public static Boolean isCalendly(BaseLead lead){
        return (lead.getType() == LeadType.CALENDLY_RAC_CREATED)
                || (lead.getType() == LeadType.CALENDLY_RAC_CANCELED);
    }
}