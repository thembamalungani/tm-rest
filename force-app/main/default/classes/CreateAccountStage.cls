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

        this.accountService = (IAccountService) Application.Service.newInstance(IAccountService.class);
        this.accountSelector = (IAccountSelector) Application.Selector.newInsatnce(IAccountSelector.class);
    }

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Map<String, Object> payloadMap = (Map<String, Object>) payload;
        BaseLead lead = (BaseLead) payloadMap.get('lead');
        Map<String, String> accountParameters = accountParamsFromLead(lead);

        Account account = this.accountSelector.findByEmail(lead.getEmail());

        if (account == null){

            account = this.accountService.create(accountParameters);

        } else {

            account = this.accountService.update(account.getId(), accountParameters);
        }

        return (Object) response(lead, account);
    }

    /**
     * Create a account domain model from payload
     *
     * @param BaseLead lead
     * @return Map<String, String>
     */
    private Map<String, String> accountParamsFromLead(BaseLead lead) {

        Map<String, String> accountParameters;

        //TODO: map account values

        return accountParameters;
    }

    /**
     * Builds a stage result
     *
     * @param Account account
     * @return Object
     */
    private Object response(BaseLead lead, Account account) {

        return StageResult.builder()
                .status(isSuccess)
                .lead(lead)
                .account(account)
                .build()
                .toMap();
    }
}
