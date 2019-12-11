/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Calendly lead
 * @date 2019-10-03
 */
public class CalendlyLeadMapper extends AbstractLeadMapper implements ILeadMapper {
    /**
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public BaseLead.ContactDetails mapContactDetails() {
        
        BaseLead.ContactDetails contactDetails  = new BaseLead.ContactDetails();
        Map<String, Object> payload             = (Map<String, Object>)leadMap.get('payload');
        Datetime callTime                       = DateTime.valueOf(((String)((Map<String, Object>)payload.get('event')).get('start_time')).replace('T', ' '));

        contactDetails.countryOfResidence 	= (String)((Map<String, Object>)payload.get('tracking')).get('utm_term');
        contactDetails.email 				= (String)((Map<String, Object>)payload.get('invitee')).get('email');
        contactDetails.firstName 			= (String)((Map<String, Object>)payload.get('invitee')).get('first_name');
        contactDetails.lastName 			= (String)((Map<String, Object>)payload.get('invitee')).get('last_name');
        contactDetails.mobilePhone 			= (String)((Map<String, Object>)payload.get('questions_and_responses')).get('1_response');
        contactDetails.phone 				= (String)((Map<String, Object>)payload.get('questions_and_responses')).get('1_response');
        contactDetails.callTime             = callTime.format('yyyy-MM-dd HH:mm:ss.SSS');

        return contactDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public BaseLead.Tracking mapTracking() {
        
        BaseLead.Tracking tracking = new BaseLead.Tracking();
        
        Map<String, Object> payload = (Map<String, Object>)leadMap.get('payload');

        tracking.countryInferred        = (String)((Map<String, Object>)payload.get('tracking')).get('utm_term');
        tracking.externalId             = (String)((Map<String, Object>)payload.get('event')).get('uuid');
        tracking.owner                  = (String)((Map<String, Object>)((List<Object>)((Map<String, Object>)payload.get('event')).get('extended_assigned_to'))[0]).get('email');
        tracking.leadCaptureFormType    = (String)leadMap.get('event');
        tracking.source                 = 'Calendly';
        tracking.productIds             = new List<String>{ (String)((Map<String, Object>)payload.get('tracking')).get('salesforce_uuid') };

        if (payload.get('old_event') != null) {
            tracking.oldExternalId  = (String)((Map<String, Object>)payload.get('old_event')).get('uuid');
        }

        return tracking;
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public BaseLead.GDPR mapGDPR() {
        
		BaseLead.GDPR gdpr = new BaseLead.GDPR();
        
		return gdpr;         
    }
}