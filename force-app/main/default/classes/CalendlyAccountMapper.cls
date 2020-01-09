public class CalendlyAccountMapper extends BaseAccountMapper implements IAccountMapper {

    /**
     * Sets the gdpr values 
     *
     * @param Account account
     * @param BaseLead lead
     * @return Account
     */
    public override Account setGDPRValues(Account account, Map<String, Object> accountParameters) {
        
        if (account == null || account.Id != null) {
            account = super.setGDPRValues(account, accountParameters);
        }

        return account;
    }
}