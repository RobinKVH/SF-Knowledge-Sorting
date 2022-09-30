public class InformationCenterCategoryUpdate {
@InvocableMethod
    public static void updateArticleTypeForDataCategories(List<Id> articleTypeIds) 
    {
        List<Information_Center__kav> lstArticleType = [SELECT Id, Title, Category__c FROM Information_Center__kav WHERE Id IN:articleTypeIds 
                                                    AND PublishStatus = 'draft'];

        List<Information_Center__DataCategorySelection> lstDC = [SELECT ParentId, DataCategoryName   FROM Information_Center__DataCategorySelection
                                                            WHERE ParentId IN:articleTypeIds];

        Map<Id, String> datacategoryNameMap = new Map<Id, String>();

        for(Information_Center__DataCategorySelection dcObj:lstDC)
        {   
            if(datacategoryNameMap.containsKey(dcObj.ParentId))
            {
                String str =  datacategoryNameMap.get(dcObj.ParentId);
                datacategoryNameMap.put(dcObj.ParentId, str + ', ' + dcObj.DataCategoryName);
            }
            else
            {
                datacategoryNameMap.put(dcObj.ParentId, dcObj.DataCategoryName);
            }
        }

        for(Information_Center__kav artObj:lstArticleType)
        {
            if(datacategoryNameMap.containsKey(artObj.Id))
            {
                artObj.Category__c = '';
                artObj.Category__c = datacategoryNameMap.get(artObj.Id);
            }
        }

        update lstArticleType;
    }
}
