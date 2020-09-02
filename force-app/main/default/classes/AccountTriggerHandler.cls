/*Author: Dipen Ishani
  Date: 2nd September, 2020*/
public class AccountTriggerHandler{
    public static void beforeMethod(list<Account> accList,Map<Id,Account> accMap){
        Set<Id> allInsertedIds = accMap.keySet();
        
        List<Account> listOfAccount = [select id, name, (select id, stagename from Opportunities where stagename!= 'Closed-Won') from Account where id =: allInsertedIds];
    
        for(Account acc:accList){
            if(acc.Active__c == 'No'){
                if(listOfAccount.size() > 0){
                    acc.addError('You cannot save this record due to all opportunities are not closed');
                }
            }        
        } 

    }

}