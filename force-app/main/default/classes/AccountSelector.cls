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
        super(Account.getSObjectType());
    }

    /**
     * Lookup an account by account id
     *
     * @param Set<Id> ids
     * @return Map<Id, Account>
     */
    public Map<Id, Account> selectByIds(Set<Id> ids) {

        String template              = 'SELECT {0} FROM Account WHERE Id IN :{1}';
        String query                 = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'ids' });
        List<Account> accounts       = Database.query(query);
        Map<Id, Account> accountsMap = new Map<Id, Account>();

        for (Account account : accounts) {
            accountsMap.put(account.Id, account);
        }

        return accountsMap;
    }

    /**
     * Lookup and account by email
     *
     * @param Set<String> emails
     * @return Map<String, Account>
     */
    public Map<String, Account> selectPersonAccountsByEmails(Set<String> emails) {
        
        String template                  = 'SELECT {0} FROM Account WHERE PersonEmail IN :{1} AND IsPersonAccount=true';
        String query                     = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), 'emails' });
        List<Account> accounts           = Database.query(query);
        
        Map<String, Account> accountsMap = new Map<String, Account>();

        for (Account account : accounts) {
            accountsMap.put(account.PersonEmail, account);
        }

        return accountsMap;
    }
}