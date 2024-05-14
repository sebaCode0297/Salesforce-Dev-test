public class UserExportUtility {
    @InvocableMethod(label='Export Users with Recent Login' description='Exports users with recent login and sends the CSV file by email')
    public static void exportUsersWithRecentLogin() {
        // Obtener la fecha actual menos 90 días
        Date cutoffDate = Date.today().addDays(-90);
        
        // Consultar los usuarios cuyo último inicio de sesión fue hace menos de 90 días
        List<User> users = [SELECT Id, Name, LastLoginDate, Email FROM User WHERE LastLoginDate >= :cutoffDate];
        
        // Crear una lista de cadenas para almacenar los datos del usuario
        List<String> csvData = new List<String>();
        
        // Agregar encabezados de columna al archivo CSV
        csvData.add('Name,Last Login Date,Email');
        
        // Recorrer los usuarios y agregar sus datos al archivo CSV
        for (User user : users) {
            String userData = '"' + user.Name + '",' + user.LastLoginDate + ',"' + user.Email + '"';
            csvData.add(userData);
        }
        
        // Crear un archivo CSV y escribir los datos en él
        String csvContent = String.join(csvData, '\n');
        Blob csvBlob = Blob.valueOf(csvContent);
        String fileName = 'UsersWithRecentLogin.csv';
        ContentVersion contentVersion = new ContentVersion(
            Title = fileName,
            PathOnClient = fileName,
            VersionData = csvBlob
        );
        insert contentVersion;
        
        // Obtener la URL de descarga del archivo CSV
        String downloadUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/sfc/servlet.shepherd/version/download/' + contentVersion.Id;
        
        // Enviar el archivo CSV por correo electrónico
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'example@example.com'};
        email.setToAddresses(toAddresses);
        email.setSubject('Usuarios con inicio de sesión reciente');
        email.setPlainTextBody('Adjunto encontrarás el archivo CSV con los usuarios cuyo último inicio de sesión fue hace menos de 90 días.');
        
        // Adjuntar el archivo CSV al correo electrónico
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName(fileName);
        attachment.setBody(csvBlob);
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
        
        // Enviar el correo electrónico
        Messaging.SendEmailResult[] emailResults = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
        System.debug('Usuarios exportados con éxito. Descarga el archivo CSV en: ' + downloadUrl);
    }
}