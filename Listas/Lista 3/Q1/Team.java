public class Team {
    private Robot[] titulares, reservas;
    private int titularesQtd, reservasQtd;

    public Team (Robot[] titulares, Robot[] reservas) {
        this.titulares = titulares;
        this.reservas = reservas;
        this.titularesQtd = titulares.length;
        this.reservasQtd = reservas.length;
    }

    public Team () {
        this(null, null, 0, 0);
    }


    public Robot[] getStartingPlayers () {
        return titulares;
    }

    public Robot[] getReservePlayers () {
        return reservas;
    }

    public int getStartingPlayersQty () {
        return this.titularesQtd;
    }

    public int getReservePlayersQty () {
        return this.reservasQtd;
    }

    public void addStartingPlayer (Robot player) {
        Robot[] temp = titulares;
        titulares = new Robot[this.titularesQtd+1];

        for (int i = 0; i < this.titularesQtd; i++) {
            titulares[i] = temp[i];
        }
        titulares[this.titularesQtd+1] = player;
        this.titularesQtd += 1;
    }

    public void addReservePlayer (Robot player) {
        Robot[] temp = reservas;
        reservas = new Robot[this.reservasQtd+1];

        for (int i = 0; i < this.reservasQtd; i++) {
            reservas[i] = temp[i];
        }
        reservas[this.reservasQtd+1] = player;
        this.reservasQtd += 1;
    }

    public void exchangePlayers(Robot titular, Robot reserva){
        int titularPos, reservaPos;
        
        for (int i = 0; i < this.titularesQtd; i++) {
            if (this.titulares[i] == titular) {
                titularPos = i;
            }
        }

        for (int j = 0; j < this.reservas; j++){
            if (this.reservas[j] == reserva) {
                reservaPos = j;
            }
        }

        Robot temp = titulares[titularPos];
        titulares[titularPos] = reservas[reservaPos];
        reservas[reservaPos] = temp; 
    }

    public void exchangePlayers(Robot reserva){
        int reservaPos;

        for (int i = 0; i < this.reservas; i++){
            if (this.reservas[i] == reserva) {
                reservaPos = i;
            }
        }

        Robot temp = titulares[titulares.length];
        titulares[titulasres.length] = reserva;
        reservas[reservaPos] = temp;
    }
}