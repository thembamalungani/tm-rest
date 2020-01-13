/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for case service
 * @date 2019-10-04
 */
public interface ICaseService {
    /**
     * Creates cases
     * 
     * @param List<Case> cases
     * @return
     */
    void createCases(List<Case> cases);  

    /**
     * Cancels cases
     * 
     * @param List<Case> cases
     * @return
     */
    void cancelCases(List<Case> cases);
}