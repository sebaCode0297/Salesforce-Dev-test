public class EnviarCorreoTareaController {
    public Id tareaId { get; set; }
    public String asunto { get; set; }
    public String destinatario { get; set; }
    public String cuerpoCorreo { get; set; }

    public EnviarCorreoTareaController() {
        tareaId = ApexPages.currentPage().getParameters().get('id');
    }

    public void enviarCorreo() {
        try {
            Task tarea = [SELECT Id, Subject, WhoId FROM Task WHERE Id = :tareaId LIMIT 1];
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

            email.setSubject(asunto);
            email.setPlainTextBody(cuerpoCorreo);
            email.setTargetObjectId(tarea.WhoId);
            email.setSaveAsActivity(false);

            Messaging.sendEmail(new List<Messaging.Email> { email });

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'El correo electrónico ha sido enviado con éxito.'));
        } catch (Exception ex) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ocurrió un error al enviar el correo electrónico: ' + ex.getMessage()));
        }
    }
}