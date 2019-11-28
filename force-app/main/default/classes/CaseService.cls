public with sharing class CaseService extends SObjectService implements ICaseService {
    /**
     * Creates cases
     * 
     * @param List<Case> cases
     */
    public void createCases(List<Case> cases) {
        super.insertObjects(cases);
    }
}