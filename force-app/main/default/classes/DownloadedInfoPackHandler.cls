/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle download info pack
 * @date 2019-10-03
 */
public class DownloadedInfoPackHandler implements ILeadHandler {

    private Object result;

    /**
     * Called when the stage is run
     * 
     * @param BaseLead lead
     * @return Object
     */
    public Object handle(BaseLead lead) {

        IPipeline pipeline;
        Map<String, Object> payload;

        pipeline = (new Pipeline(new FingersCrossedProcessor()))
                    .pipe(new CreateAccountStage())
                    .pipe(new CreateOpportunityStage());

        payload = new Map<String, Object>{ 'lead' => lead };

        result  = pipeline.process(payload);

        return result;
    }

    /**
     * Determines if the lead was handle successfully
     *
     * @return Boolean
     */
    public Boolean isSuccess() {

        Map<String, Object> responseMap = (Map<String, Object>) this.result;

        if ( responseMap.get('account') != null && responseMap.get('opportunity') != null ) {
            return true;
        }

        return false;
    }
}