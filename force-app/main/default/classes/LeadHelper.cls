public class LeadHelper {
    
    /**
     * Creates a map of account fields to lead values
     *
     * @param BaseLead lead
     * @return Map<String, String>
     */
    public static Map<String, Object> toAccountProperties(BaseLead lead) {

        Map<String, Object> accountParameters = new  Map<String, Object>{
            'PersonEmail'                           => lead.contactDetails.email,
            'FirstName'                             => lead.contactDetails.firstname,
            'LastName'                              => lead.contactDetails.lastname,
            'Country_Inferred__pc'                  => lead.tracking.countryInferred,
            'PersonTitle'                           => lead.contactDetails.jobTitle,
            'Phone'                                 => lead.contactDetails.phone,
            'PersonMobilePhone'                     => lead.contactDetails.mobilePhone,
            'Education_Highest_Level__pc'           => lead.contactDetails.educationHighestLevel,
            'Occupation__pc'                        => lead.contactDetails.occupation,
            'Employer_Company_Name__pc'             => lead.contactDetails.employerCompanyName,
            'Employee_Industry__pc'                 => lead.contactDetails.employeeIndustry,
            'Work_Experience__pc'                   => lead.contactDetails.workExperience,
            'PersonOtherCountry'                    => lead.contactDetails.countryOfResidence,
            'PersonDoNotCall'                       => lead.gdpr.gdprCallOptIn,
            'PersonHasOptedOutOfEmail'              => lead.gdpr.gdprEmailOptIn,
            'Do_Not_SMS__pc'                        => lead.gdpr.gdprSmsOptIn,
            'Do_Not_Share_2U_Marketing__pc'         => lead.gdpr.gdprProspect2uOptIn,
            'Do_Not_Share_Partner_Marketing__pc'    => lead.gdpr.gdprProspectPartnerOptIn
        };

        return accountParameters;
    }

    
    /**
     * Creates a map of opportunity fields to lead values
     *
     * @param BaseLead lead
     * @param Account account
     * @return Map<String, String>
     */
    public static Map<String, Object> toOpportunityProperties(BaseLead lead, Account account) {

        Map<String, Object> opportunityProperties = new  Map<String, Object>{
            'Name'                          => lead.contactDetails.firstName + ' ' + lead.contactDetails.lastName,
            'StageName'                     => 'New Interest',
            'CloseDate'                     => Date.today().addMonths(1),
            'Google_Analytics_Client_Id__c' => lead.tracking.googleAnalyticsClientId,
            'Segment_Anonymous_Id__c'       => lead.tracking.segmentAnonymousId,
            'Lead_Capture_Form_URL__c'      => lead.tracking.leadCaptureFormUrl,
            'Lead_Capture_Form_Type__c'     => lead.tracking.leadCaptureFormType,
            'AccountId'                     => account.Id,
            'Segment_Sync_Status__c'        => 'New Opportunity Pending Synchronisation',
            'Inferred_Presentation__c'      => lead.tracking.productIds.get(0)
        };

        return opportunityProperties;
    }
}
