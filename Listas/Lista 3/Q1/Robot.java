public class Robot {
    private String nome;
    private int camisa;
    private Position posicao;

    public Robot (String nome, int camisa, Posicao posicao) {
        this.nome = nome;
        this.camisa = camisa;
        this.posicao = posicao;
    }

    public Robot (String nome) {
        this.nome = nome;
        this.camisa = -1;
        this.posicao = new Posicao(-1, -1);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public int getCamisa() {
        return this.camisa;
    }

    public void setCamisa(int camisa) {
        this.camisa = camisa;
    }

    public void setPosicao(Position coordinates) {
        this.posicao = posicao;
    }

    public Position getPosicao() {
        return this.posicao;
    }
}