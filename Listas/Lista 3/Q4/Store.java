public class Store {
    private DatabaseWeasleys estoque;

    public void adicionarProduto(String nomeDoProduto, Integer quantidade, Float preco) throws Exception {
        if(this.estoque.getTamanhoEstoque() < 50) {
            this.estoque.inserir(nomeDoProduto, quantidade, preco);
        }
        else {
            System.out.println("Estoque chegou ao limite de 50 produtos.");
        }
    }

    public void removerProduto(String nomeDoProduto) throws Exception {
        this.estoque.remover(nomeDoProduto);
    }

    public void atualizarProduto(String nomeDoProduto, Integer quantidade, Float preco) throws Exception { 
        this.estoque.atualizar(nomeDoProduto, quantidade, preco);
    }

    public void venderParaCliente(String nomeDoProduto, Integer quantidade, Client cliente) throws Exception {
        // Obtendo produto
        Triple<String, Integer, Float> produto = this.estoque.getProduto(nomeDoProduto);
        
        // Verificar se o cliente tem saldo
        Float valorDaCompra = (produto.getThird() * quantidade);
        if(cliente.getSaldo() < valorDaCompra) {
            throw new Exception("Saldo do cliente insuficiente para operação.");
        }

        // Verificar se existem produtos o suficiente
        if(produto.getSecond() < quantidade) {
            throw new Exception("Quantidade disponivel do produto insuficiente para operação.");
        }

        // Realizar desconto de saldo, pontuacao e atualização da quantidade de itens na store
        cliente.setSaldo(cliente.getSaldo() - valorDaCompra);
        cliente.setPontuacao(cliente.getPontuacao() + ( (int) (valorDaCompra * 0.1) ));
        this.estoque.atualizar(nomeDoProduto, produto.getSecond() - quantidade, produto.getThird());

        System.out.println("Venda realizada com sucesso: '" + quantidade + "x " + produto.getFirst() + "'");

        // Verificar brinde
        this.verificarBrinde(cliente);
    }

    public void verificarBrinde(Client cliente) throws Exception {
        // Verificar saldo do cliente
        if(cliente.getSaldo() >= 500) {
            // Obter brinde (item de menor valor da loja)
            Triple<String, Integer, Float> brinde = this.estoque.getBrinde();

            // Atualizar estoque
            this.estoque.atualizar(brinde.getFirst(), brinde.getSecond() - 1, brinde.getThird());

            System.out.println("Cliente ganhou um brinde: '" + brinde.getFirst() + "'");
        }
    }

    public Store() {
        this.estoque = new DatabaseWeasleys();
    }
}