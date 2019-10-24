public with sharing class CaseService implements ICaseService {

    public Case createCase(BaseLead lead, Account account, Opportunity opportunity) {

        return new Case();
    }
}
