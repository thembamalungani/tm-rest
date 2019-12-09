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
        
        contactDetails.countryOfResidence 	= (String)leadMap.get('payload').get('tracking').get('utm_term');
        contactDetails.email 				= (String)leadMap.get('payload').get('invitee').get('email');
        contactDetails.firstName 			= (String)leadMap.get('payload').get('invitee').get('first_name');
        contactDetails.lastName 			= (String)leadMap.get('payload').get('invitee').get('last_name');
        contactDetails.mobilePhone 			= (String)leadMap.get('payload').get('questions_and_responses').get('response_1');
        contactDetails.phone 				= (String)leadMap.get('payload').get('questions_and_responses').get('response_1');

        return contactDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public override BaseLead.Tracking mapTracking() {
        
        BaseLead.Tracking tracking = new BaseLead.Tracking();
        
        tracking.countryInferred 			= (String)leadMap.get('countryInferred');
        tracking.externalId 				= (String)leadMap.get('payload').get('');
        tracking.googleAnalyticsClientId 	= (String)leadMap.get('googleAnalyticsClientId');
        tracking.leadCaptureFormType 		= (String)leadMap.get('leadCaptureFormType');
        tracking.leadCaptureFormUrl 		= (String)leadMap.get('leadCaptureFormUrl');
        tracking.productIds 				= new List<String>();
        
        for(Object item: (List<Object>)leadMap.get('productIds')){
            tracking.productIds.add((String)item);
        }
        
        return tracking;

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