public class LeadHandlerFactory {

    public static final Map<LeadType, ILeadHandler> handlers = new Map<LeadType,ILeadHandler>{
        LeadType.DOWNLOADED_INFO_PACK           => new DownloadedInfoPackHandler(),
        LeadType.REQUESTED_A_CALL               => new RequestedACallHandler(),
        LeadType.SUBMITTED_REGISTRATION_STEP1   => new SubmittedRegistrationStep1Handler(),
        LeadType.CALENDLY_RAC_CREATED           => new CalendlyHandler(),
        LeadType.CALENDLY_RAC_CANCELED          => new CalendlyHandler()
    };

    /**
     * Get the handler for the specific lead type
     *
     * @param LeadType leadType
     * @return ILeadHandler
     */
    public static ILeadHandler getHandler(BaseLead lead) {

        ILeadHandler handler;

        try {
            handler = handlers.get(lead.getType());
        } catch (Exception e) {
            System.debug('No handler for lead type: ' + lead.getType().name());
        }

    	return handler;
    }
}