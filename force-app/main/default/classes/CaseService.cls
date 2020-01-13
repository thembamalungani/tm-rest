/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Stage used to find eliginle product
 * @date 2019-10-04
 */
public with sharing class CaseService extends SObjectService implements ICaseService {
    /**
     * Creates cases
     * 
     * @param List<Case> cases
     */
    public void createCases(List<Case> cases) {
        for (Case newCase: cases) {
            if (newCase.Status == 'Rescheduled') {
                update newCase;
            } else {
                newCase.Id = null;
                insert newCase;
            }
        }
    }

    /**
     * Cancels cases
     *
     * @param List<Case> cases
     */
    public void cancelCases(List<Case> cases) {

        Map<Id, Case> cancelCases = new Map<Id, Case>();

        for (Case cancelCase :cases) {
            cancelCase.Status = 'Cancelled';
            cancelCases.put(cancelCase.Id, cancelCase);
        }

        super.updateObjects(cancelCases);
    }
}