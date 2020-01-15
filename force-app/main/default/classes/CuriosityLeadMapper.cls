/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Maps lead map to BaseLead instance
 * @date 2019-10-04
 */
public class CuriosityLeadMapper extends AbstractLeadMapper implements ILeadMapper {
    
    /**
     * Parses the contact details from leadMap
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
        tracking.source                     = 'Curiosity';
        
        if (leadMap.get('productIds') != null) {
            tracking.productIds = new List<String>((List<String>)leadMap.get('productIds'));
        }

        if (leadMap.get('productUuids') != null) {
            tracking.productUuids = new List<String>((List<String>)leadMap.get('productUuids'));
        }

        if (leadMap.get('productParentUuids') != null) {
            tracking.productParentUuids = new List<String>((List<String>)leadMap.get('productParentUuids'));
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