public class AccountMapperFactory {
    
    /**
     * Gets an account mapper based on lead
     *
     * @param BaseLead lead
     * @return IAccountMapper
     */
    public static IAccountMapper getMapper(BaseLead lead)
    {
        IAccountMapper mapper;

        if ( this.isCalendly(lead) ) {

            mapper = new CalendlyAccountMapper();

        } else {
            
            mapper = new CalendlyAccountMapper();
        }

        return mapper;
    }

    /**
     * Checks if the lead is a calendly event
     *
     * @param BaseLead lead
     * @return Boolean
     */
    private Boolean isCalendly(BaseLead lead)
    {
        return (lead.getType() == LeadType.CALENDLY_RAC_CREATED)
                || (lead.getType() == LeadType.CALENDLY_RAC_CANCELED);
    }
}
