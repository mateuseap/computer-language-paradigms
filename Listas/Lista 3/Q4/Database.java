public interface Database {
    public void inserir(String nomeDoProduto, Integer quantidade, Float preco) throws Exception;
    public void remover(String nomeDoProduto) throws Exception;
    public void atualizar(String nomeDoProduto, Integer quantidade, Float preco) throws Exception;
}