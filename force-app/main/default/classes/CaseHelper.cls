public class CaseHelper {
    
    /**
     * Prepares a requested a call case
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return Case
     */
    public static Case prepareFor(BaseLead lead, Account account, Opportunity opportunity) {

        String productId    = (lead.tracking.productIds != null && lead.tracking.productIds.size() == 1) ? lead.tracking.productIds.get(0) : 'Unknown';  
        String subject      = subject(lead);
        String description  = description(lead);
        Datetime calltime   = calltime(lead);

        Case newCase = (new CaseSelector()).selectByExternalId( lead.tracking.externalId );

        newCase = (newCase == null) ? new Case() : newCase;

        newCase.Description = description;
        newCase.subject     = subject;

        return newCase;
    }

    /**
     * Create a subject time for a case
     *  
     * @param BaseLead lead
     * @return String
     */
    public static String subject(BaseLead lead) {
        
        Course__c course  = [SELECT Name FROM Course__c WHERE UUID__c=:lead.tracking.externalId LIMIT 1];

        return String.format('Request a Call | {0}', new String[]{ course.Name });
    }

    /**
     * Creates a description of the lead
     *
     * @param BaseLead lead
     * @return String
     */
    public static String description(BaseLead lead) {

        Course__c course            = [SELECT Id, Course_Name__c, University__c, Faculty__c, School__c FROM Course__c WHERE Id IN (SELECT Course__c FROM Product2 WHERE Id=:lead.tracking.externalId) LIMIT 1];
        University__c university    = [SELECT Id, University_Name__c FROM University__c WHERE Id IN (SELECT University__c FROM Course__c WHERE Id=:course.Id) LIMIT 1];
        School__c school            = [SELECT Id, Name FROM School__c WHERE Id IN (SELECT School__c FROM Course__c WHERE Id=:course.Id) LIMIT 1];
        Faculty__c faculty          = [SELECT Id, Name FROM Faculty__c WHERE Id IN (SELECT Faculty__c FROM Course__c WHERE Id=:course.Id) LIMIT 1];

        Map<String, Object> values = new Map<String, Object>{
            'First Name' => lead.contactDetails.firstname,
            'Last Name'  => lead.contactDetails.lastname,
            'Cellphone'  => lead.contactDetails.mobilePhone,
            'Telephone'  => lead.contactDetails.phone,
            'Email'      => lead.contactDetails.email,
            'Date/Time'  => calltime(lead),
            'University' => university.Name,
            'Faculty'    => faculty.Name,
            'School'     => school.Name
        };

        return description(values);
    }

    /**
     * Prepares the description from map of values
     *
     * @param Map<String, String> values
     * @return String
     */
    public static String description(Map<String, Object> values) {

        String description = '';

        for (String key : values.keySet()) {
            String value = String.valueOf(values.get(key));

            if (!String.isBlank(value)) {
                description += Key + ': ' + value + '\n';
            }
        }

        return description;
    }

    /**
     * Converts the lead call time to date time
     *
     * @param BaseLead lead
     * @return Datetime
     */
    public static Datetime calltime(BaseLead lead){
        
        try{

            return Datetime.valueOf('some time');

        } catch (Exception ex) {

            return System.now();
        }
    }
}
