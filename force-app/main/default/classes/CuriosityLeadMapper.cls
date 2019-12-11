public class CuriosityLeadMapper extends AbstractLeadMapper implements ILeadMapper {
    
    /**
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public BaseLead.ContactDetails mapContactDetails() {
        
        BaseLead.ContactDetails contactDetails = new BaseLead.ContactDetails();
        
        contactDetails.countryOfResidence       = (String)leadMap.get('countryOfResidence');
        contactDetails.email                    = (String)leadMap.get('email');
        contactDetails.firstName                = (String)leadMap.get('firstName');
        contactDetails.lastName                 = (String)leadMap.get('lastName');
        contactDetails.mobilePhone              = (String)leadMap.get('mobilePhone');
        contactDetails.phone                    = (String)leadMap.get('phone');
        contactDetails.employeeIndustry	        = (String)leadMap.get('employeeIndustry');
        contactDetails.employerCompanyName      = (String)leadMap.get('employerCompanyName');
        contactDetails.occupation               = (String)leadMap.get('occupation');
        contactDetails.educationHighestLevel    = (String)leadMap.get('educationHighestLevel');
        contactDetails.workExperience	        = (String)leadMap.get('workExperience');
        contactDetails.jobTitle                 = (String)leadMap.get('jobTitle');
        contactDetails.callTime                 = (String)leadMap.get('callTime');
        contactDetails.dateOfBirth              = (String)leadMap.get('dateOfBirth');
        
        return contactDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public BaseLead.Tracking mapTracking() {
        
        BaseLead.Tracking tracking = new BaseLead.Tracking();
        
        tracking.countryInferred            = (String)leadMap.get('countryInferred');
        tracking.externalId                 = (String)leadMap.get('externalId');
        tracking.googleAnalyticsClientId    = (String)leadMap.get('googleAnalyticsClientId');
        tracking.leadCaptureFormType        = (String)leadMap.get('leadCaptureFormType');
        tracking.leadCaptureFormUrl         = (String)leadMap.get('leadCaptureFormUrl');
        tracking.productIds                 = new List<String>();
        tracking.source                     = 'Curiosity';
        
        for(Object item: (List<Object>)leadMap.get('productIds')){
            tracking.productIds.add((String)item);
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
        
        gdpr.gdprCallOptIn              = (Boolean)leadMap.get('gdprCallOptIn');
        gdpr.gdprEmailOptIn 	        = (Boolean)leadMap.get('gdprEmailOptIn');
        gdpr.gdprProspect2uOptIn        = (Boolean)leadMap.get('gdprProspect2uOptIn');
        gdpr.gdprProspectPartnerOptIn   = (Boolean)leadMap.get('gdprProspectPartnerOptIn');
        gdpr.gdprSmsOptIn               = (Boolean)leadMap.get('gdprSmsOptIn');
	
        return gdpr;         
    }
}