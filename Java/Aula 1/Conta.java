// Crie a classe Conta conforme apresentado em sala

package learningJava;

public class Conta {
  private String number;
  private double saldo;

  public void creditar(double valor) {
    saldo = saldo + valor;
  }

  public void debitar(double valor) {
    saldo = saldo - valor;
  }

  public void setNumber(String nmbr) {
    number = nmbr;
  }
  
  public void setSaldo(double valor) {
    saldo = valor;
  }

  public double getSaldo() {
    return saldo;
  }

  public String getNumero() {
    return number;
  }
}