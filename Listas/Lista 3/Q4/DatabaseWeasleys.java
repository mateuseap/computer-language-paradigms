import java.util.List;
import java.util.ArrayList; 

public class DatabaseWeasleys implements Database {
    private List<Triple<String, Integer, Float>> estoque = new ArrayList<>();

    public void inserir(String nomeDoProduto, Integer quantidade, Float preco) throws Exception {
        for (int i = 0; i < estoque.size(); i++) {
            if(estoque.get(i).getFirst() == nomeDoProduto) {
                throw new Exception("Produto já registrado.");
            }
        }
        estoque.add(new Triple<>(nomeDoProduto, quantidade, preco));
    }

    public void remover(String nomeDoProduto) throws Exception {
        Boolean found = false;
        for (int i = 0; i < estoque.size(); i++) {
            if(estoque.get(i).getFirst() == nomeDoProduto) {
                found = true;
                estoque.remove(i);
                break;
            }
        }
        if(!found) {
            throw new Exception("Produto não encontrado para remoção.");
        }
    }

    public void atualizar(String nomeDoProduto, Integer quantidade, Float preco) throws Exception {
        Integer index = -1;
        for (int i = 0; i < estoque.size(); i++) {
            if(estoque.get(i).getFirst() == nomeDoProduto) {
                index = i;
                break;
            }
        }

        if(index != -1) {
            estoque.get(index).setSecond(quantidade);
            estoque.get(index).setThird(preco);

            // Se zerar quantidade, remove o produto da lista.
            if(quantidade == 0) {
                this.remover(nomeDoProduto);
            }
        }
        else {
            throw new Exception("Produto não encontrado para atualização.");
        }
    }

    public Triple<String, Integer, Float> getProduto(String nomeDoProduto) throws Exception {
        for (int i = 0; i < estoque.size(); i++) {
            if(estoque.get(i).getFirst() == nomeDoProduto) {
                return estoque.get(i);
            }
        }

        throw new Exception("Produto não encontrado.");
    }

    public Triple<String, Integer, Float> getBrinde() throws Exception {
        if(this.getTamanhoEstoque() == 0) {
            throw new Exception("Não existem produtos para serem fornecidos como brinde.");
        }
        else {
            Float lowestPrice = 999999999.0f;
            int lowestPriceIndex = -1;
            for (int i = 0; i < this.getTamanhoEstoque(); i++) {
                if(this.estoque.get(i).getThird() < lowestPrice) {
                    lowestPrice = this.estoque.get(i).getThird();
                    lowestPriceIndex = i;
                }
            }

            return this.estoque.get(lowestPriceIndex);
        }
    }

    public Integer getTamanhoEstoque() {
        return estoque.size();
    }
}