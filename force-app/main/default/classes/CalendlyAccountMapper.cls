public class CalendlyAccountMapper extends AccountMapper {
    
    /**
     * Creates a map of account fields to lead values
     *
     * @param Account account
     * @param Map<String, String> accountParameters
     * @return Map<String, String>
     */
    public Account doMap(Account account, Map<String, String> accountParameters) {

        if ( account == null ) {

            accountParameters = this.removeGDPRFields(accountParameters);
        }
       
        return super.doMap(account, accountParameters);
    }

    /**
     * Removes gdpr fields from the parameters
     *
     * @param Map<String, String> accountParameters
     * @return Map<String, String>
     */
    private Map<String, String> removeGDPRFields(Map<String, String> accountParameters) {
        
        accountParameters.remove('PersonDoNotCall');
        accountParameters.remove('PersonHasOptedOutOfEmail');
        accountParameters.remove('Do_Not_SMS__pc');
        accountParameters.remove('Do_Not_Share_2U_Marketing__pc');
        accountParameters.remove('Do_Not_Share_Partner_Marketing__pc');

        return accountParameters;
    }
}
