/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Implementation of account selector
 * @date 2019-10-21
 */
public class AccountSelector extends ObjectSelector implements IAccountSelector {
    
    /**
     * AccountSelector cosntructor
     */
    public AccountSelector() {

        super(Account);
    }

    /**
     * Lookup an account by account id
     *
     * @param Set<Id> ids
     * @return Map<Id, Account>
     */
    public Map<Id, Account> selectByIds(Set<Id> ids) {
        
        Set<Schema.SObjectField> fields = this.getFieldSet();

        String template = 'SELECT {0} FROM Account WHERE Id IN :{1}';

        String query = String.format(template, new List<String>{ fields.join(', '), 'ids' });

        Map<Id, Account> accounts = new Map<Id, Accounts>(Database.query(query));

        return accounts;
    }

    /**
     * Lookup and account by email
     *
     * @param Set<String> emails
     * @return Map<String, Account>
     */
    public Map<String, Account> selectPersonAccountsByEmails(Set<String> emails) {

        Set<Schema.SObjectField> fields = this.getFieldSet();

        String template = 'SELECT {0} FROM Account WHERE Id IN :{1} AND AND IsPersonAccount=true';

        String query = String.format(template, new List<String>{ fields.join(', '), 'emails' });

        List<Account> accounts = Database.query(query);

        Map<String, Account> accountsMap = new Map<String, Account>();

        for (Account account : accounts) {
            
            accountsMap.put(account.PersonEmail, account);
        }

        return accountsMap;
    }
}
