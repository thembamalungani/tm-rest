/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Determines where the to create or update an account
 * @date 2019-10-09
 */
public with sharing class AccountService implements IAccountService {

    /**
     * Creates or update an account based on condition
     *
     * @param Map<String, String> parameters
     * @return Account
     */
    public Account createAccount(Map<String, String> parameters){
        
        Account account = fromParameters(parameters);

        if (Schema.SObjectType.Account.isCreateable()) {

            insert account;
        }

        return account;
    }

    /**
     * Creates or update an account based on condition
     *
     * @param Account account
     * @param ISpecification specification
     * @return Account
     */
    public Account updateAccount(Id accountId, Map<String, String> parameters){
        
        Account account = this.accountSelector.find(accountId);

        if (Schema.SObjectType.Account.isCreateable()) {

            insert account;
        }

        return account;
    }
}
