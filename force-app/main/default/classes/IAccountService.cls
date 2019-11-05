/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for account service
 * @date 2019-10-09
 */
public interface IAccountService {

    /**
     * Creates or update an account based on condition
     *
     * @param List<Accounts> accounts
     */
    void createAccounts(List<Account> accounts);

    /**
     * Updates account with passed id with the parameters
     *
     * @param Map<Id, Account> objectsMap
     */
    void updateAccounts(Map<Id, Account> objectsMap);
}
