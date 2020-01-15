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

        if ( LeadHelper.isCalendly(lead) ) {
            mapper = new CalendlyAccountMapper();
        } else {
            mapper = new CuriosityAccountMapper();
        }

        return mapper;
    }
}