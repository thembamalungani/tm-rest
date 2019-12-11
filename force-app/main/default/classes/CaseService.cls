public with sharing class CaseService extends SObjectService implements ICaseService {
    /**
     * Creates cases
     * 
     * @param List<Case> cases
     */
    public void createCases(List<Case> cases) {
        super.insertObjects(cases);
    }

    /**
     * Cancels cases
     *
     * @param List<Case> cases
     */
    public void cancelCases(List<Case> cases) {

        Map<Id, Case> cancelCases = new Map<Id, Case>();

        for (Case cancelCase : cases) {
            cancelCase.Status = 'Cancelled';
            cancelCases.put(cancelCase.Id, cancelCase);
        }

        super.updateObjects(cancelCases);
    }
}