public virtual class BaseAccountMapper implements IAccountMapper{
    
    /**
     * Does a mapping from account properties to account fields
     *
     * @param Account account
     * @param Map<String, Object> accountParameters
     * @return Account
     */
    public virtual Account doMap(Account account, Map<String, Object> accountParameters) {
        
        account = (account == null) ? new Account() : account;

        for (String key : accountParameters.keySet()) {

            if ( booleanFields().contains(key) && accountParameters.get(key) != null ) {
                account.put(key, (Boolean)accountParameters.get(key));
            } else {
                account.put(key, (String)accountParameters.get(key));
            }
        }

        return setGDPRValues(account, accountParameters);
    }

    /**
     * Sets the gdpr values 
     *
     * @param Account account
     * @param BaseLead lead
     * @return Account
     */
    public virtual Account setGDPRValues(Account account, Map<String, Object> accountParameters) {

        account.PersonDoNotCall                     = (accountParameters.get('PersonDoNotCall') != null )                       ? !(Boolean)accountParameters.get('PersonDoNotCall') : false;
        account.PersonHasOptedOutOfEmail            = (accountParameters.get('PersonHasOptedOutOfEmail') != null )              ? !(Boolean)accountParameters.get('PersonHasOptedOutOfEmail') : false;
        account.Do_Not_SMS__pc                      = (accountParameters.get('Do_Not_SMS__pc') != null )                        ? !(Boolean)accountParameters.get('Do_Not_SMS__pc') : true;
        account.Do_Not_Share_2U_Marketing__pc       = (accountParameters.get('Do_Not_Share_2U_Marketing__pc') != null )         ? !(Boolean)accountParameters.get('Do_Not_Share_2U_Marketing__pc') : true;
        account.Do_Not_Share_Partner_Marketing__pc  = (accountParameters.get('Do_Not_Share_Partner_Marketing__pc') != null )    ? !(Boolean)accountParameters.get('Do_Not_Share_Partner_Marketing__pc') : true;

        return account;
    }

    /**
     * Gets account boolean fields
     *
     * @return List<String>
     */
    public List<String> booleanFields() {
        return new List<String>{
          'PersonDoNotCall',
          'PersonHasOptedOutOfEmail',
          'Do_Not_SMS__pc',
          'Do_Not_Share_2U_Marketing__pc',
          'Do_Not_Share_Partner_Marketing__pc'
        };
    }
}
