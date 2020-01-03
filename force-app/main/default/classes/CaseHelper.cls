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

        Datetime callTime   = calltime(lead);
        Case newCase        = (new CaseSelector()).selectByExternalId(lead.tracking.oldExternalId);

        newCase = (newCase == null) ? new Case() : newCase;

        newCase.Description             = description(lead);
        newCase.subject                 = subject(lead);
        newCase.Status                  = newCase.Id == null ? 'New' : 'Rescheduled';
        newCase.Priority                = 'High';
        newCase.Origin                  = 'Web';
        newCase.RecordTypeId            = [SELECT Id FROM RecordType WHERE DeveloperName = 'Sales_Case' LIMIT 1].Id;
        newCase.AccountId               = account.Id;
        newCase.Type                    = 'Request a Call';
        newCase.Calendly_Event_Uuid__c  = lead.tracking.externalId;
        newCase.Requested_Call_Date__c  = callTime.date();
        newCase.Requested_Call_Time__c  = callTime.time();

        newCase = setOwner(newCase, lead);

        return newCase;
    }

    /**
     * Sets the assignment rules for the case
     *
     * @param Case newCase
     * @param BaseLead lead
     *
     * @return Case
     */
    public static Case setOwner(Case newCase, BaseLead lead) {

        if (!String.isBlank(lead.tracking.owner)) {
            newCase.OwnerId = [SELECT Id FROM User WHERE Email = :lead.tracking.owner LIMIT 1].Id;
        } else {

            try {
                Id salesCaseAssignmentRuleId    = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1].Id;
                Database.DMLOptions dmlOpts     = new Database.DMLOptions();
                dmlOpts.assignmentRuleHeader.assignmentRuleId = salesCaseAssignmentRuleId;
                newCase.setOptions(dmlOpts);
                
            } catch(Exception e){}
        }

        return newCase;
    }

    /**
     * Create a subject time for a case
     *  
     * @param BaseLead lead
     * @return String
     */
    public static String subject(BaseLead lead) {
        
        Course__c course = (new CourseSelector()).selectByPresentationId(lead.tracking.productIds.get(0));

        return String.format('Request a Call | {0}', new String[]{  ( course != null ) ? course.Name : 'Unknown' });
    }

    /**
     * Creates a description of the lead
     *
     * @param BaseLead lead
     * @return String
     */
    public static String description(BaseLead lead) {

        String presentationId   = lead.tracking.productIds.get(0);
        Course__c course        = (Course__c)((new CourseSelector()).selectByPresentationId(presentationId));

        Map<String, Object> values = new Map<String, Object>{
            'First Name' => lead.contactDetails.firstname,
            'Last Name'  => lead.contactDetails.lastname,
            'Cellphone'  => lead.contactDetails.mobilePhone,
            'Telephone'  => lead.contactDetails.phone,
            'Email'      => lead.contactDetails.email,
            'Date/Time'  => calltime(lead),
            'University' => (course != null) ? course.University__r.Name : 'Unknown',
            'Faculty'    => (course != null) ? course.Faculty__r.Name : 'Unknown',
            'School'     => (course != null) ? course.School__r.Name : 'Unknown'
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
            return Datetime.valueOf(lead.contactDetails.callTime);
        } catch (Exception ex) {
            return System.now();
        }
    }
}
