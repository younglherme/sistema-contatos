@isTest
public class ContatoServiceTest {

    @isTest
    static void testCriarContato() {
        Test.startTest();

        Contato_Projeto__c resultado = ContatoService.criarContato(
            'Guilherme Silva', 'gluizdasilva@gmail.com', '24993145766');
        Test.stopTest();

        System.assertNotEquals(null, resultado.Id);
        System.assertEquals('Guilherme Silva', resultado.Name);
        System.assertEquals('gluizdasilva@gmail.com', resultado.Email__c);
        System.assertEquals('24993145766', resultado.Telefone__c);
    }

    @isTest
    static void testListarContatos() {
        insert new Contato_Projeto__c(
            Name= 'Teste',Email__c = 'teste@gmail.com'
        );
        
        Test.startTest();

        List<Contato_Projeto__c> contatos = 
        ContatoService.listarContatos();

        Test.stopTest();

        System.assertEquals(1, contatos.size());
    }
}
