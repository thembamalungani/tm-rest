public class CalendlyAccountMapper extends BaseAccountMapper implements IAccountMapper {
    /**
     * Creates a map of account fields to lead values
     *
     * @param Account account
     * @param Map<String, Object> accountParameters
     * @return Map<String, Object>
     */
    public override Account doMap(Account account, Map<String, Object> accountParameters) {

        if (account != null && account.Id != null ) {
            accountParameters = this.removeGDPRFields(accountParameters);
        }
       
        return super.doMap(account, accountParameters);
    }

    /**
     * Removes gdpr fields from the parameters
     *
     * @param Map<String, Object> accountParameters
     * @return Map<String, Object>
     */
    private Map<String, Object> removeGDPRFields(Map<String, Object> accountParameters) {
        
        accountParameters.remove('PersonDoNotCall');
        accountParameters.remove('PersonHasOptedOutOfEmail');
        accountParameters.remove('Do_Not_SMS__pc');
        accountParameters.remove('Do_Not_Share_2U_Marketing__pc');
        accountParameters.remove('Do_Not_Share_Partner_Marketing__pc');

        return accountParameters;
    }
}