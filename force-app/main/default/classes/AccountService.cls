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
     * @return List<Database.SaveResult>
     */
    public List<Database.SaveResult> createAccounts(List<Account> accounts) {

        return super.insertObjects(accounts);
    }

    /**
     * Updates account with passed id with the parameters
     *
     * @param Map<Id, SObjectType> objectsMap
     * @return List<Database.SaveResult>
     */
    public List<Database.SaveResult> updateAccounts(Map<Id, SObjectType> objectsMap) {

        return super.updateObjects(objectsMap);
    }
}
