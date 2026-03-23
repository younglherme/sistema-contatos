public with sharing class ContatoService {

    @AuraEnabled(cacheable=true)
    public static List<Contato_Projeto__c> listarContatos() {
        return [
            SELECT id, Name, Email__c, Telefone__c
            FROM Contato_Projeto__c
            ORDER BY Name ASC
                    ];
    }

    @AuraEnabled
    public static Contato_Projeto__C criarContato(
        String nome, String email, String telefone
    ){
        try {
            Contato_Projeto__c contato = new Contato_Projeto__c(
                Name = nome,
                Email__c = email,
                Telefone__c = telefone
            );
            insert contato;
            return contato;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static Contato_Projeto__C deletarContato(Id contatoId) {
        try {
            Contato_Projeto__c contato = [
                SELECT Id 
                FROM Contato_Projeto__c 
                WHERE Id = :contatoId LIMIT 1];
           
            delete contato;
        }
    }
}