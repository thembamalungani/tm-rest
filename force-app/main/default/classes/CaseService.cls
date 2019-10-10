public with sharing class CaseService implements ICaseService {
    public CaseService() {

    }

    public Case createCase(BaseLead lead, Account account, Opportunity opportunity) {

        return new Case();
    }
}
