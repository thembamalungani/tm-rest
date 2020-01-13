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
        return Pattern.compile('[a-zA-Z0-9]{15,18}').matcher(toCheck).matches()
    }
}
