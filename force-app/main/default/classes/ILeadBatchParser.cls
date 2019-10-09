/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for handling lead batch parsing
 * @date 2019-10-03
 */
public interface ILeadBatchParser {

    /**
     * Parses the json string as collection
     *
     * @param String json
     * @return List<BaseLead>
     */
    List<BaseLead> parse(String json);
}
