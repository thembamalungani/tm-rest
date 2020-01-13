/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Maps lead parameters to Account object
 * @date 2019-10-04
 */
public class CuriosityAccountMapper extends BaseAccountMapper implements IAccountMapper {
    /**
     * Maps account fields to account properties in map
     *
     * @param Account account
     * @param Map<String, Object> accountParameters
     * @return Account
     */
    public override Account doMap(Account account, Map<String, Object> accountParameters) {

        account = super.doMap(account, accountParameters);

        if (account.Id == null) {
            account = applyGDPRValues(account, accountParameters);
        }

        return account;
    }

    /**
     * Applies the GDPR business logic 
     *
     * @param Account account
     * @param Map<String, Object> accountParameters
     * @return Account
     */
    public static Account applyGDPRValues(Account account, Map<String, Object> accountParameters) {
        
        account.PersonDoNotCall                     = (accountParameters.get('PersonDoNotCall') != null ) ? !(Boolean)accountParameters.get('PersonDoNotCall') : false;
        account.PersonHasOptedOutOfEmail            = (accountParameters.get('PersonHasOptedOutOfEmail') != null) ? !(Boolean)accountParameters.get('PersonHasOptedOutOfEmail') : false;
        account.Do_Not_SMS__pc                      = (accountParameters.get('Do_Not_SMS__pc') != null) ? !(Boolean)accountParameters.get('Do_Not_SMS__pc') : false;
        account.Do_Not_Share_2U_Marketing__pc       = (accountParameters.get('Do_Not_Share_2U_Marketing__pc') != null) ? !(Boolean)accountParameters.get('Do_Not_Share_2U_Marketing__pc') : false;
        account.Do_Not_Share_Partner_Marketing__pc  = (accountParameters.get('Do_Not_Share_Partner_Marketing__pc') != null) ? !(Boolean)accountParameters.get('Do_Not_Share_Partner_Marketing__pc') : false;

        return account;
    }
}