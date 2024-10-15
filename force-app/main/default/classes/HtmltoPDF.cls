public class HtmltoPDF{

    
    @RemoteAction
    public static void saveFile(blob blobContent) {
        String name = 'HTMLTOPDF';
        Opportunity opp = new Opportunity(Name='Test Opportunity');
        opp.StageName='closed';
        opp.CloseDate=system.today();
        Insert opp;
    
       //insert contentVersion
        contentVersion cVersion = new contentVersion();
        cVersion.Title = name;
        system.debug('title'+cVersion.title);
        cVersion.PathOnClient = name +'.'+'pdf'; 
        system.debug('PathOnClient'+cVersion.PathOnClient);
        //cVersion.versionData = Blob.valueOf(blobContent);
        cVersion.versionData = blobContent;
        system.debug('Version data'+cVersion.versionData);
        insert cVersion; 
         
        ID conDocument = [Select ContentDocumentID from ContentVersion 
        where ID=:cVersion.ID].ContentDocumentID;
       //insert ContentDocumentLink
     
        ContentDocumentLink conDocLink = new ContentDocumentLink();
        conDocLink.LinkedEntityId = opp.Id;
        conDocLink.ContentDocumentId = conDocument;
        conDocLink.shareType = 'V';
        conDocLink.Visibility = 'AllUsers';
        insert conDocLink;
    }
}