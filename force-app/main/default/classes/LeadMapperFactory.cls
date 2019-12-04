public class LeadMapperFactory {
	
    public static AbstractLeadMapper getMapper(LeadType lead) {
        
        AbstractLeadMapper mapper;
        
        if (isCuriosityLead(lead)) {
            mapper = new CuriosityLeadMapper();
        } else if (isCalendlyLead(lead)) {
            mapper = new CalendlyLeadMapper();
        }
        
        return mapper;
    }
    
    public static Boolean isCalendlyLead(LeadType lead) {
        
        Boolean isCalendlyLead;
        
        isCalendlyLead = (lead == LeadType.CALENDLY_RAC_CANCELED) 
            			|| (lead == LeadType.CALENDLY_RAC_CREATED);
        
        return isCalendlyLead;
    }
    
    public static Boolean isCuriosityLead(LeadType lead){
        
        Boolean isCuriosityLead;
        
        isCuriosityLead = (lead == LeadType.DOWNLOADED_INFO_PACK) 
            			|| (lead == LeadType.REQUESTED_A_CALL) 
            			|| (lead == LeadType.SUBMITTED_REGISTRATION_STEP1);
        
        return isCuriosityLead;
    }
}