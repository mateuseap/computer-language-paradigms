// Ler um nome de uma pessoa e exibir o seu primeiro e o seu último nome

import java.util.Scanner;

public class Exercicio1 {
    public static void main(String args[]) {
      Scanner sc = new Scanner(System.in); //System.in is a standard input stream  
      System.out.print("Digite o nome completo: ");  
      
      String name = sc.nextLine();  
      String[] separatedName = name.split(" ", 0);

      System.out.println("Primeiro: " + separatedName[0]);
      System.out.println("Último: " + separatedName[separatedName.length-1]);
    }
}