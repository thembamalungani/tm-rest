public class AccountMapper {

    /**
     * Maps account fields to account properties in map
     *
     * @param Account account
     * @param Map<String, String> accountParameters
     * @return Account
     */
    public virtual Account doMap(Account account, Map<String, String> accountParameters) {

        if ( account == null ) {

            account = new Account();
        }

        for (String key : accountParameters.keySet()) {
            
            account.put(key, accountParameters.get(key));
        }

        return account;
    }
}
