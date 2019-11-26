public interface IAccountMapper {
    
    /**
     * Creates a map of account fields to lead values
     *
     * @param Account account
     * @param Map<String, String> accountParameters
     * @return Account
     */
    Account doMap(Account account, Map<String, String> accountParameters);
}