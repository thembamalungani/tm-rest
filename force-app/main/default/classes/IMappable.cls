/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a contract mapable models
 * @date 2019-10-01
 */
public interface IMappable {
    /**
     * Creates an instance of mappable from the mapper
     *
     * @param AbstractLeadMapper mapper
     * @return BaseLead
     */
    BaseLead fromMapper();

    /**
     * Sets an instance of ILeadMapper
     *
     * @param ILeadMapper mapper
     */
    void setMapper(ILeadMapper mapper);
}