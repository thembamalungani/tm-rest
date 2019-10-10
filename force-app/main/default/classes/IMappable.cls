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
    BaseLead fromMapper(AbstractLeadMapper mapper);
}
