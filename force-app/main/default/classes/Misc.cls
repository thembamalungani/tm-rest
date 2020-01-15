/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contains utility functions
 * @date 2019-10-03
 */
public class Misc {
    /**
     * Checks if the passed string qualifies to be a salesforce Id
     *
     * @param String toCheck
     * @return Boolean
     */
    public static Boolean isSalesforceId(String toCheck) {

        String salesforceIdRegex = '[a-zA-Z0-9]{15,18}';

        return Pattern.compile(salesforceIdRegex).matcher(toCheck).matches();
    }

    public static String systemEmail() {
        
        try {
            return EnvironmentVariables__c.getValues('LEAD_EVENTS_GROUP_EMAIL').get('Value__c').toString();
        } catch (System.Exception e) {
            return 'ct-crm-alerts@2u.com';
        }
    }
}
