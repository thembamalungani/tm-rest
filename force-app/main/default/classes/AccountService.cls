/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Determines where the to create or update an account
 * @date 2019-10-09
 */
public with sharing class AccountService extends SObjectService implements IAccountService {

    /**
     * Creates or update an account based on condition
     *
     * @param List<Accounts> accounts
     */
    public void createAccounts(List<Account> accounts) {

        super.insertObjects(accounts);
    }

    /**
     * Updates account with passed id with the parameters
     *
     * @param Map<Id, Account> objectsMap
     */
    public void updateAccounts(Map<Id, Account> objectsMap) {

        super.updateObjects(objectsMap);
    }
}