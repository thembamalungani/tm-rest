/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for account service
 * @date 2019-10-09
 */
public interface IAccountService {

    /**
     * Creates or update an account based on condition
     *
     * @param Map<String, String> parameters
     * @return Account
     */
    Account _create(Map<String, String> parameters);

    /**
     * Updates account with passed id with the parameters
     *
     * @param Id accountId
     * @param Map<String, String> parameters
     * @return Account
     */
    Account _update(Id accountId, Map<String, String> parameters);

    /**
     * Finds a account with the passed email
     *
     * @param String email
     * @return Account
     */
    Account findByEmail(String email);
}
