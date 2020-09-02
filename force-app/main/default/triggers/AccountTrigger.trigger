trigger AccountTrigger on Account (before insert, before update) {
    
    //  Set<Id> AccIds = new Set<Id>();
    //  Set<Id> allInsertedIds = trigger.newMap.keySet();
          
     /* for(Account accId: Trigger.new){
          AccIds.add(accId.id);
      }*/
      /*
      List<Account> listOfAccount = [select id, name, (select id, stagename from Opportunities where stagename!= 'Closed-Won') from Account where id =: allInsertedIds];
     
      for(Account acc:Trigger.new){
          if(acc.Active__c == 'No'){
              if(listOfAccount.size() > 0){
                  acc.addError('You cannot save this record due to all opportunities are not closed');
              }
          }        
      } */
      if(Trigger.IsBefore){
          AccountTriggerHandler.beforeMethod(Trigger.new,Trigger.newMap);
      }
      
  }