/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Lead helper class
 * @date 2019-10-03
 */
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

        try {
            accountParameters.put('Language_Home__pc', [SELECT Id, Name FROM Language__c WHERE Name = :lead.contactDetails.languageHome LIMIT 1].Id);
        }catch(Exception e){}

        return accountParameters;
    }


    /**
     * Checks if the lead is a calendly event
     *
     * @param BaseLead lead
     * @return Boolean
     */
    public static Boolean isCalendly(BaseLead lead){
        return (lead.getType() == LeadType.CALENDLY_RAC_CREATED)
                || (lead.getType() == LeadType.CALENDLY_RAC_CANCELED);
    }
}