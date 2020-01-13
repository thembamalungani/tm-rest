public class LeadMapperFactory {
    /**
     * Determines the mapper for the passed lead type
     * 
     * @param LeadType lead
     * @return ILeadMapper
     */
    public static ILeadMapper getMapper(LeadType lead) {
        
        ILeadMapper mapper;
        
        if (isCuriosityLead(lead)) {
            mapper = new CuriosityLeadMapper();
        } else if (isCalendlyLead(lead)) {
            mapper = new CalendlyLeadMapper();
        }
        
        return mapper;
    }
    
    /**
     * Determines if the passed lead type is a calendly lead
     *
     * @param LeadType lead
     * @return Boolean
     */
    public static Boolean isCalendlyLead(LeadType lead) {
        
        Boolean isCalendlyLead;
        
        isCalendlyLead = (lead == LeadType.CALENDLY_RAC_CANCELED) 
            			|| (lead == LeadType.CALENDLY_RAC_CREATED);
        
        return isCalendlyLead;
    }
    
    /**
     * Determines if the passed lead type is a curiosity lead
     *
     * @param LeadType lead
     * @return Boolean
     */
    public static Boolean isCuriosityLead(LeadType lead){
        
        Boolean isCuriosityLead;
        
        isCuriosityLead = (lead == LeadType.DOWNLOADED_INFO_PACK) 
            			|| (lead == LeadType.REQUESTED_A_CALL) 
            			|| (lead == LeadType.SUBMITTED_REGISTRATION_STEP1);
        
        return isCuriosityLead;
    }
}