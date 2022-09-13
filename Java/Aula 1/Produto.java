// Crie uma classe Produto para representar produtos de supermecado

public class Produto {
  private String descricao;
  private double preco;
  private int estoque;

  public void alteraPreco(double novoPreco) {
    preco = novoPreco;
  }

  public void aumentaEstoque(int qtd) {
    estoque += qtd;
  }

  public void diminuiEstoque(int qtd) {
    estoque -= qtd;
  }

  public String getDescricao() {
    return descricao;
  }
  
  public double getPreco() {
    return preco;
  }

  public int getEstoque() {
    return estoque;
  }
}