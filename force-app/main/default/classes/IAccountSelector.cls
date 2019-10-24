/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for account selector
 * @date 2019-10-21
 */
public interface IAccountSelector {

    /**
     * Lookup an account by account id
     *
     * @param Set<Id> ids
     * @return Map<Id, Account>
     */
    Map<Id, Account> selectByIds(Set<Id> ids);

    /**
     * Lookup and account by email
     *
     * @param Set<String> emails
     * @return Map<String, Account>
     */
    Map<String, Account> selectPersonAccountsByEmails(Set<String> emails);
}
