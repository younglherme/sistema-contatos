import { LightningElement, track } from 'lwc';
import listarContatos from '@salesforce/apex/ContatoService.listarContatos';
import criarContatoApex from '@salesforce/apex/ContatoService.criarContato';

export default class ListaContatos extends LightningElement {
    @track contatos = [];

    connectedCallback() {
        this.carregarContatos();
    }

    carregarContatos() {
        listarContatos()
            .then(resultado => { this.contatos = resultado; })
            .catch(erro => console.error(erro));
    }

    criarContato() {
        const nome     = this.template.querySelector('[data-id="nome"]').value;
        const email    = this.template.querySelector('[data-id="email"]').value;
        const telefone = this.template.querySelector('[data-id="telefone"]').value;

        criarContatoApex({ nome, email, telefone })
            .then(() => this.carregarContatos())
            .catch(erro => console.error(erro));
    }
}