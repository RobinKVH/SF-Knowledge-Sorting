# SF-Knowledge-Sorting
Salesforce's knowledge and data structure is a real PITA. One pain point is lack of list view soring based on category. Got around it by using an apex class to transfer it into a custom field on the article. 

1. Create a custom obejct on article. In this case it is Category__c.

2. Create the apex class and load it into your prod org.

3. This is an invocable method, so you'll need to link to a flow / workflow to call this class. I have it tied to any edit on an artilcle. 
