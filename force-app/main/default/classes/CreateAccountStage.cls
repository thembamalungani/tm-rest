/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This stage is used to create an account
 * @date 2019-10-09
 */
public class CreateAccountStage implements IPipelineStage {
    
    /**
     * @param IAccountService accountService
     */
    private IAccountService accountService;

    /**
     * @param IAccountSelector accountSelector
     */
    private IAccountSelector accountSelector;

    /**
     * Wire dependencies
     */
    public CreateAccountStage() {

        this.accountService = new AccountService();
        this.accountSelector = new AccountSelector();
    }

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        BaseLead lead;
        Account account;
        Map<String, Object> payloadMap;
        Map<String, String> accountParameters;

        payloadMap          = (Map<String, Object>) payload;
        lead                = (BaseLead) payloadMap.get('lead');
        accountParameters   = LeadHelper.toAccountProperties(lead);
        account             = createOrUpdateAccount(accountParameters);

        payload.put('account', account);

        return payload;
    }

    /**
     * Creates or updates an account based on person email existence
     *
     * @param Map<String, String> accountParameters
     * @param BaseLead lead
     * @return Account
     */
    private Account createOrUpdateAccount(Map<String, String> accountParameters, BaseLead lead) {

        String email            = accountParameters.get('PersonEmail');
        Account account         = this.accountSelector.selectByEmails(new Set<String>{ email }).get(emails);
        IAccountMapper mapper   = AccountMapperFactory.getMapper(lead.tracking.source);

        if ( account != null ) {

            account = mapper.doMap(account, accountParameters); 
            this.accountService.updateAccounts(new Map<Id, Account>{account.Id => account});
            
        } else {

            this.accountService.createAccounts(new List<Account>{account});
        }
        
        return account;
    }

    /**
     * Builds a stage result
     *
     * @param Account account
     * @return Object
     */
    private Object response(BaseLead lead, Account account) {

        return StageResult.builder()
                .lead(lead)
                .stageAccount(account)
                .build()
                .toMap();
    }
}
