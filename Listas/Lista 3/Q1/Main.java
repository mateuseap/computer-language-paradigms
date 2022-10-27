public class Main {
    public static void main (String[] args) {
        Team t1 = new Team();

        t1.addStartingPlayer(new Robot("Bobby Fischer", 3, new Posicao(7,0)));
        t1.addStartingPlayer(new Robot("Nalbert Melo", 1, new Posicao(6,3)));
        t1.addReservePlayer(new Robot("Magnus Carlsen", 8, new Posicao(9,9)));
        t1.addReservePlayer(new Robot("Sarah Melo", 2, new Posicao(2,9)));

        t1.exchangePlayers(t1.getStartingPlayers[1], t1.getReservePlayers[0]);
        
        Robot[] t2Titulares = new Robot[2];
        Robot[] t2Reservas = new Robot[2];

        t2Titulares[0] = new Robot("Mateus Elias", 10, new Posicao(2,3));
        t2Titulares[1] = new Robot("Dayane Lira", 18, new Posicao(3,2));
        t2Reservas[0] = new Robot("Zildao", 7, new Posicao(6,0));
        t2Reservas[1] = new Robot("Victor Hugo", 9, new Posicao(0,6));

        Team t2 = new Team(t2Titulares, t2Reservas);

        t2.exchangePlayers(t2Reservas[0]);

        Robot[] t1TitularesAux = t1.getStartingPlayers();
        Robot[] t2ReservasAux = t2.getReservePlayers();

        System.out.println("Time 1 (titulares): \n");
        for (int i = 0; i < 2; i++) {
            System.out.println(t1TitularesAux[i].getNome() + " " + t1TitularesAux[i].getCamisa() + " " + t1TitularesAux[i].getPosicao());
            
        }

        System.out.println("Time 2 (reservas): \n");
        for (int i = 0; i < 2; i++) {
            System.out.println(t2Reservas[i].getNome() + " " + t2Reservas[i].getCamisa() + " " + t2Reservas[i].getPosicao());
        }
    }
}