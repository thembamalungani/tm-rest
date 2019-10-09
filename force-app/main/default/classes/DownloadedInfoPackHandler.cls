/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle download info pack
 * @date 2019-10-03
 */
public class DownloadedInfoPackHandler implements ILeadHandler {

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public HandleResult handle(Object payload) {

        BaseLead lead = (BaseLead) payload;

        IPipeline pipeline = (new Pipeline(new FingersCrossedProcessor()))
                                .pipe(new CreateAccountStage())
                                .pipe(new CreateOpportunityStage());

        return pipeline.process(payload);
    }
}
