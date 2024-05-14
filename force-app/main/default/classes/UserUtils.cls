public class UserUtils {
    @InvocableMethod
    public static void deactivateSelectedUsers(List<Id> userIds) {
        List<User> usersToDeactivate = [
            SELECT Id, Name, LastLoginDate, IsActive
            FROM User
            WHERE Id IN :userIds AND Id = '0055e000007Y8xqAAC' AND IsActive = true
        ];
        
        // Desactivar los usuarios seleccionados
        for (User user : usersToDeactivate) {
            user.IsActive = false;
        }
        update usersToDeactivate;
        
        // Generar el archivo CSV
        List<String> csvData = new List<String>();
        csvData.add('Id, Name, Last Login Date, IsActive');
        for (User user : usersToDeactivate) {
            String[] rowData = new String[] {
                user.Id,
                user.Name,
                String.valueOf(user.LastLoginDate),
                String.valueOf(user.IsActive)
            };
            csvData.add(String.join(rowData, ','));
        }
        
        // Descargar el archivo CSV
        String csvContent = String.join(csvData, '\n');
        ContentVersion content = new ContentVersion(
            Title = 'Usuarios Desactivados.csv',
            PathOnClient = 'Usuarios Desactivados.csv',
            VersionData = Blob.valueOf(csvContent),
            IsMajorVersion = true
        );
        insert content;
    }
}