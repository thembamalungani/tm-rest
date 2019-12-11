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
        
        Course__c course  = (new CourseSelector()).selectByCourseId(lead.tracking.externalId);

        return String.format('Request a Call | {0}', new String[]{  ( course != null ) ? course.Name : 'Unknown' });
    }

    /**
     * Creates a description of the lead
     *
     * @param BaseLead lead
     * @return String
     */
    public static String description(BaseLead lead) {

        Course__c course            = (new CourseSelector()).selectByCourseId(lead.tracking.externalId);
        University__c university    = (new UniversitySelector()).selectByCourseId(lead.tracking.externalId);
        School__c school            = (new SchoolSelector()).selectByCourseId(lead.tracking.externalId);
        Faculty__c faculty          = (new FacultySelector()).selectByCourseId(lead.tracking.externalId);

        Map<String, Object> values = new Map<String, Object>{
            'First Name' => lead.contactDetails.firstname,
            'Last Name'  => lead.contactDetails.lastname,
            'Cellphone'  => lead.contactDetails.mobilePhone,
            'Telephone'  => lead.contactDetails.phone,
            'Email'      => lead.contactDetails.email,
            'Date/Time'  => calltime(lead),
            'University' => (university != null) ? university.Name : 'Unknown',
            'Faculty'    => (faculty != null) ? faculty.Name : 'Unknown',
            'School'     => (school != null) ? school.Name : 'Unknown'
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
            return Datetime.valueOf(lead.callTime);
        } catch (Exception ex) {
            return System.now();
        }
    }
}
