public virtual class AccountMapper {

    /**
     * Maps account fields to account properties in map
     *
     * @param Account account
     * @param Map<String, Object> accountParameters
     * @return Account
     */
    public virtual Account doMap(Account account, Map<String, Object> accountParameters) {

        if ( account == null ) {

            account = new Account();
        }

        for (String key : accountParameters.keySet()) {
            
            if ( booleanFields().contains(key) ) {
                
                account.put(key, (Boolean)accountParameters.get(key));
                
            } else {
                
                account.put(key, (String)accountParameters.get(key));
            }
        }

        return account;
    }
    
    protected List<String> booleanFields() {
        
        List<String> booleanFields = new List<String>{
          'PersonDoNotCall',
          'PersonHasOptedOutOfEmail',
          'Do_Not_SMS__pc',
          'Do_Not_Share_2U_Marketing__pc',
          'Do_Not_Share_Partner_Marketing__pc'
        };
        
        return booleanFields;
    }
}