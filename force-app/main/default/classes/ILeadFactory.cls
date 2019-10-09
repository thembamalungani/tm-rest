/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for lead factory
 * @date 2019-10-04
 */
public interface ILeadFactory {

    BaseLead createFrom(Map<String, Object> leadMap);
}
