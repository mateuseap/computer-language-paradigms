import learningJava.Conta;

public class Programa {
  public static void main(String[] args) {
    Conta c = new Conta();
    c.setNumber("123-X");
    c.setSaldo(8.0);
    c.creditar(10.0);
    c.debitar(5.0);
    System.out.println("Conta " + c.getNumero());
    System.out.println("Saldo " + c.getSaldo());
  }
}