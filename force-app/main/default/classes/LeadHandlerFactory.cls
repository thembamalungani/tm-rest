public with sharing class LeadHandlerFactory {
    
    public static ILeadHandler getHandler(BaseLead lead) {

        ILeadHandler handler;

        if (lead.getType() == LeadType.DOWNLOADED_INFO_PACK) {
            handler = new DownloadedInfoPackHandler();
        } else if (lead.getType() == LeadType.REQUESTED_A_CALL) {
            handler = new RequestedACallHandler();
        } else if (lead.getType() == LeadType.SUBMITTED_REGISTRATION_STEP1) {
            handler = new SubmittedRegistrationStep1Handler();
        } else if (lead.getType() == LeadType.CALENDLY_RAC_CREATED || lead.getType() == LeadType.CALENDLY_RAC_CANCELED) {
            handler = new CalendlyHandler();
        }

    	return handler;
    }
}