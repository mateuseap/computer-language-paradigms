public class Main {
    public static void main(String[] args) {
        /// Instanciando loja
        Store store = new Store();

        // Adicionando produtos
        try {
            store.adicionarProduto("Varinha", 200, 69.96f);
            store.adicionarProduto("Chapeu", 24, 10.0f);
            store.adicionarProduto("Polissuco", 48, 10.2f);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        /// Criando um cliente
        Client cliente = new Client(10000.0f, 0);

        // Causando exception na compra: comprando sem ter saldo suficiente
        try {
            store.venderParaCliente("Varinha", 200, cliente);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        try {
            // Gerando compra bem sucedida para gerar brinde para o cliente
            store.venderParaCliente("Varinha", 100, cliente);

            // Removendo produto do estoque
            store.removerProduto("Varinha");
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        // Gerando exceção para verificar que o produto foi realmente removido
        try {
            store.venderParaCliente("Varinha", 1, cliente);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}