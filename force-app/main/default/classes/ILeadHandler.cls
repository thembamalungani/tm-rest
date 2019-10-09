/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for lead handler
 * @date 2019-10-01
 */
public interface ILeadHandler {

    /**
     * Handles the lead and return handle results
     *
     * @param BaseLead leads
     * @return BaseLead
     */
    HandleResult handle(BaseLead lead);
}
