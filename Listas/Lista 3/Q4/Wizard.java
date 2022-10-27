public class Wizard {
    private String nome;
    private String varinha;

    public String getNome() {
        return this.nome;
    }

    public String varinha() {
        return this.varinha;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setVarinha(String varinha) {
        this.varinha = varinha;
    }

    public Wizard(String nome, String varinha) {
        this.nome = nome;
        this.varinha = varinha;
    }
}