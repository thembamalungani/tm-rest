/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Calendly lead
 * @date 2019-10-03
 */
public class CalendlyLeadMapper extends AbstractLeadMapper {
    /**
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public override BaseLead.ContactDetails mapContactDetails() {
        
        BaseLead.ContactDetails contactDetails = new BaseLead.ContactDetails();
        
        Map<String, Object> payload = (Map<String, Object>)leadMap.get('payload');

        contactDetails.countryOfResidence 	= (String)((Map<String, Object>)payload.get('tracking')).get('utm_term');
        contactDetails.email 				= (String)((Map<String, Object>)payload.get('invitee')).get('email');
        contactDetails.firstName 			= (String)((Map<String, Object>)payload.get('invitee')).get('first_name');
        contactDetails.lastName 			= (String)((Map<String, Object>)payload.get('invitee')).get('last_name');
        contactDetails.mobilePhone 			= (String)((Map<String, Object>)payload.get('questions_and_responses')).get('response_1');
        contactDetails.phone 				= (String)((Map<String, Object>)payload.get('questions_and_responses')).get('response_1');

        return contactDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public override BaseLead.Tracking mapTracking() {
        
        BaseLead.Tracking tracking = new BaseLead.Tracking();
        
        Map<String, Object> payload = (Map<String, Object>)leadMap.get('payload');

        tracking.countryInferred 			= (String)((Map<String, Object>)payload.get('tracking')).get('utm_term');
        tracking.externalId 				= (String)((Map<String, Object>)payload.get('event')).get('uuid');
        tracking.leadCaptureFormType 		= (String)leadMap.get('event');
        tracking.productIds 				= new List<String>{
            (String)((Map<String, Object>)payload.get('tracking')).get('salesforce_uuid')
        };

        return tracking;
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public override BaseLead.GDPR mapGDPR() {
        
		BaseLead.GDPR gdpr = new BaseLead.GDPR();
        
		return gdpr;         
    }
}