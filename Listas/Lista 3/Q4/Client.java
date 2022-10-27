public class Client {
    private float saldo;
    private int pontuacao;

    public float getSaldo() {
        return this.saldo;
    }

    public int getPontuacao() {
        return this.pontuacao;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    }

    public Client(float saldo, int pontuacao) {
        this.saldo = saldo;
        this.pontuacao = pontuacao;
    }
}